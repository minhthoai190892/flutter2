import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        title: const Text('Cart Screen'),
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Text('N'),
              ),
              title: const Text('data'),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('data'),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  CircleAvatar(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.remove)),
                  ),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  CircleAvatar(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sub Total: '),
            const Text(
              "PKR: 12.0",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                      color: AppConstant.appMainColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
