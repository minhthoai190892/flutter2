// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_food_delivery_ecommerce/constants/app_constrants.dart';
import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';
import 'package:firebase_food_delivery_ecommerce/service/database.dart';
import 'package:firebase_food_delivery_ecommerce/service/shared_preferences.dart';
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
  String? wallet, id;
  int? add;
  TextEditingController amountController = TextEditingController();
  getthesharedpref() async {
    wallet = await SharedPreferencesHelper().getUserWallet();
    id = await SharedPreferencesHelper().getUserId();
    setState(() {});
  }

  onTheLoad() async {
    await getthesharedpref();
    setState(() {});
  }

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
    add = int.parse(wallet!) + int.parse(amount);
    await DatabaseMethod().updateUserWallet(id!, add.toString());
    await SharedPreferencesHelper().saveUserWallet(add.toString());
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                Text('Payment success'),
              ],
            ),
          ),
        );
        // cập nhật lại ví
        await getthesharedpref();
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
  void initState() {
    // TODO: implement initState
    super.initState();
    onTheLoad();
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
                          "\$ $wallet",
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
                  GestureDetector(
                    onTap: () {
                      makePayment('500');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xFFE9E2E2))),
                      child: Text(
                        "\$ 500",
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makePayment('1000');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xFFE9E2E2))),
                      child: Text(
                        "\$ 1000",
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makePayment('2000');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xFFE9E2E2))),
                      child: Text(
                        "\$ 2000",
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => openEdit(),
                child: Container(
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

  Future openEdit() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            content: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.cancel),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text('Amount'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your amount',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      makePayment(amountController.text);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
                        'Pay',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      );
}
