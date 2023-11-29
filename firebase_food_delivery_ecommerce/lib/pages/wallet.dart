// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_food_delivery_ecommerce/constants/app_constrants.dart';
import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../widgets/app_widget.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  Map<String, dynamic>? paymentIntent;
  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Adnan'))
          .then((value) {});
      displayPaymentSheet(amount);
    } catch (e) {
      print('exception $e');
    }
  }

  void displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    Text('Payment success'),
                  ],
                )
              ],
            ),
          ),
        );
        // await usergetprofile();
        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:-----> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is----->$e');
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(content: Text('Cancel')),
      );
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      'Wallet',
                      style: AppWidget.headlineTextFeildStyle(),
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: width,
                decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
                child: Row(
                  children: [
                    Image.asset(
                      ImageManager.wallet,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your wallet',
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$ 100",
                          style: AppWidget.boldTextFeildStyle(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Add Memory',
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      makePayment('100');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xFFE9E2E2))),
                      child: Text(
                        "\$ 100",
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFE9E2E2))),
                    child: Text(
                      "\$ 500",
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFE9E2E2))),
                    child: Text(
                      "\$ 1000",
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFE9E2E2))),
                    child: Text(
                      "\$ 2000",
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 139, 44),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Add money',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print('Payment intent Body ->>>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (e) {
      print('Error chargin user: $e');
    }
  }

  calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount) * 100);
    return calculateAmount.toString();
  }
}
