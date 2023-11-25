// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';
import 'package:firebase_food_delivery_ecommerce/widgets/app_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false;
  bool pizza = false;
  bool salad = false;
  bool burger = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 50, horizontal: width / 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Food Delivery App',
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Text(
                'Delicious food',
                style: AppWidget.headlineTextFeildStyle(),
              ),
              Text(
                'Discover and Get Great Food ',
                style: AppWidget.lightTextFeildStyle(),
              ),
              SizedBox(
                height: height / 30,
              ),
              showItem(width, height),
              SizedBox(
                height: height / 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageManager.saladImage2,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Veggie Taco',
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                            SizedBox(
                              height: height / 140,
                            ),
                            Text(
                              'Fresh and Healthy',
                              style: AppWidget.lightTextFeildStyle(),
                            ),
                            SizedBox(
                              height: height / 140,
                            ),
                            Text(
                              '\$25',
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageManager.saladImage2,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Veggie Taco',
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                            SizedBox(
                              height: height / 140,
                            ),
                            Text(
                              'Fresh and Healthy',
                              style: AppWidget.lightTextFeildStyle(),
                            ),
                            SizedBox(
                              height: height / 140,
                            ),
                            Text(
                              '\$25',
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row showItem(double width, double height) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          burger = true;
          icecream = false;
          pizza = false;
          salad = false;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: burger ? Colors.black : Colors.white),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              ImageManager.burgerImage,
              width: width / 6,
              height: height / 13,
              color: burger ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          burger = false;
          icecream = true;
          pizza = false;
          salad = false;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: icecream ? Colors.black : Colors.white),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              ImageManager.icecreamImage,
              width: width / 6,
              height: height / 13,
              color: icecream ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          burger = false;
          icecream = false;
          pizza = true;
          salad = false;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: pizza ? Colors.black : Colors.white),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              ImageManager.pizzaImage,
              width: width / 6,
              height: height / 13,
              color: pizza ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          burger = false;
          icecream = false;
          pizza = false;
          salad = true;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: salad ? Colors.black : Colors.white),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              ImageManager.saladImage,
              width: width / 6,
              height: height / 13,
              color: salad ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    ]);
  }
}
