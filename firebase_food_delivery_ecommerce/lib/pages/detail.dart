import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';
import 'package:firebase_food_delivery_ecommerce/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageManager.saladImage2,
              width: width,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Column(
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove)),
                ),
                const SizedBox(width: 15),
                Text(
                  '$quantity',
                  style: AppWidget.boldTextFeildStyle(),
                ),
                const SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(Icons.add)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'data',
              style: AppWidget.lightTextFeildStyle(),
              maxLines: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Delivery Time',
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                Text(
                  '30 min',
                  style: AppWidget.semiBoldTextFeildStyle(),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price:',
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                      Text(
                        '\$25',
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                    ],
                  ),
                  Container(
                    width: width / 2,
                    padding: const EdgeInsets.only(
                        left: 30, top: 10, bottom: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
