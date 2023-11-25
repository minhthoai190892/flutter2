import 'package:firebase_food_delivery_ecommerce/pages/detail.dart';
import 'package:firebase_food_delivery_ecommerce/widgets/app_widget.dart';
import 'package:flutter/material.dart';

import '../constants/image_manager.dart';

class ListItemHorizontal extends StatelessWidget {
  const ListItemHorizontal({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Detail(),
                  ));
            },
            child: Material(
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
    );
  }
}
