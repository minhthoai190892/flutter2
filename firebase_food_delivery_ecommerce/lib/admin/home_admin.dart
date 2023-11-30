import 'package:firebase_food_delivery_ecommerce/admin/add_food.dart';
import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';
import 'package:firebase_food_delivery_ecommerce/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                'Home Admin',
                style: AppWidget.headlineTextFeildStyle(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddFood(),
                  )),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            ImageManager.saladImage2,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          'Add food Item',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
