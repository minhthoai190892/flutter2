import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController codeC = TextEditingController();
    final TextEditingController nameC = TextEditingController();
    final TextEditingController qtyC = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            maxLength: 10,
            controller: codeC,
            autofocus: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Product Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: codeC,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: codeC,
            autofocus: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.isLoading.isFalse) {
                controller.isLoading(true);
                // Map<String, dynamic> hasil =
                //     await authC.login(emailC.text, passC.text);
                controller.isLoading(false);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: Obx(() => Text(
                controller.isLoading.isFalse ? 'Add Product' : 'Loading...')),
          ),
        ],
      ),
    );
  }
}
