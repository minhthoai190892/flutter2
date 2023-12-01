import 'package:firebase_food_delivery_ecommerce/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Item',
          style: AppWidget.headlineTextFeildStyle(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Upload the Item Picture',
                style: AppWidget.semiBoldTextFeildStyle(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Material(
                elevation: 5,
                borderRadius: BorderRadiusDirectional.circular(20),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.camera_alt_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Item Name', style: AppWidget.semiBoldTextFeildStyle()),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: width,
              decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Item price',
                    hintStyle: AppWidget.lightTextFeildStyle()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Item Price', style: AppWidget.semiBoldTextFeildStyle()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: width,
              decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: priceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item price';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Item price',
                    hintStyle: AppWidget.lightTextFeildStyle()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Item Detail', style: AppWidget.semiBoldTextFeildStyle()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: width,
              decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: detailController,
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item detail';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Item detail',
                    hintStyle: AppWidget.lightTextFeildStyle()),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
