import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:qr_code_getx/app/controllers/auth_controller.dart';
import 'package:qr_code_getx/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AuthController authC = AuthController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          late String title = '';
          late IconData icon = Icons.note_add_rounded;
          late VoidCallback onTap;
          switch (index) {
            case 0:
              title = 'Add Product';
              icon = Icons.note_add_rounded;
              onTap = () => Get.toNamed(Routes.ADD_PRODUCT);
              break;
            case 1:
              title = 'Products';
              icon = Icons.list_alt_outlined;
              onTap = () => Get.toNamed(Routes.PRODUCTS);

              break;
            case 2:
              title = 'QR Code';
              icon = Icons.qr_code;
              onTap = () {
                
              };

              break;
            case 3:
              title = 'Catalog';
              icon = Icons.document_scanner_outlined;
              onTap = () => controller.testPdf();

              break;
            default:
          }
          return Material(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(9),
            child: InkWell(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      icon,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(title),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout),
        onPressed: () async {
          Map<String, dynamic> hasil = await authC.logout();
          if (!hasil['error'] == false) {
            Get.offAllNamed(Routes.LOGIN);
          } else {
            Get.snackbar('Error', hasil['message']);
          }
        },
      ),
    );
  }
}
