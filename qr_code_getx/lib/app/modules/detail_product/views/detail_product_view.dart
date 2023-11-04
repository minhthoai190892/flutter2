import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_getx/app/data/models/product_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    final TextEditingController codeC = TextEditingController();
    final TextEditingController nameC = TextEditingController();
    final TextEditingController qtyC = TextEditingController();
    codeC.text = product.code;
    nameC.text = product.name;
    qtyC.text = '${product.qty}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailProductView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                color: Colors.grey[300],
                child: QrImageView(
                  data: product.code,
                  size: 200,
                  version: QrVersions.auto,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            readOnly: true,
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
            controller: nameC,
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
            controller: qtyC,
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
              if (controller.isLoadingUpdate.isFalse) {
                if (nameC.text.isNotEmpty && qtyC.text.isNotEmpty) {
                  controller.isLoadingUpdate(true);
                  Map<String, dynamic> hasil = await controller.editProduct({
                    'id': product.productId,
                    'name': nameC.text,
                    'qty': int.tryParse(qtyC.text) ?? 0,
                  });
                  Get.snackbar(hasil['error'] == true ? 'Error' : 'Success',
                      hasil['message']);
                  controller.isLoadingUpdate(false);
                } else {
                  Get.snackbar(
                    'Error',
                    'Can not blank the name and quantity',
                    duration: const Duration(
                      seconds: 2,
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: Obx(() => Text(controller.isLoadingUpdate.isFalse
                ? 'Update Product'
                : 'Loading...')),
          ),
          TextButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Delete Product',
                middleText: 'Are you sure you want to delete',
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> hasil =
                          await controller.deleteProduct(product.productId);
                      Get.back();//close dialog
                      Get.back();//return all products page
                      Get.snackbar(hasil['error'] ? 'Error' : 'Success',
                          hasil['message']);
                      controller.isLoadingDelete(true);
                    },
                    child: Obx(
                      () => controller.isLoadingDelete.isFalse
                          ? const Text('Delete')
                          : Container(
                              height: 15,
                              width: 15,
                              padding: const EdgeInsets.all(2),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1,
                              ),
                            ),
                    ),
                  ),
                ],
              );
            },
            child: Text(
              'Delete Product',
              style: TextStyle(
                color: Colors.red[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
