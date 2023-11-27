import 'package:firebase_food_delivery_ecommerce/constants/content_model.dart';
import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';
import 'package:firebase_food_delivery_ecommerce/pages/signup.dart';
import 'package:firebase_food_delivery_ecommerce/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height / 1.5,
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (value) {
                currentIndex = value;
                print("currentIndex: $currentIndex");
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        contents[index].image,
                        height: 200,
                        width: width / 1.5,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        contents[index].title,
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        contents[index].description,
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length, (index) => buildDot(index, context)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ));
              }
              _controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(40),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 18 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38),
    );
  }
}
