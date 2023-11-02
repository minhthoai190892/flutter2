import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_getx/app/controllers/auth_controller.dart';
import 'package:qr_code_getx/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailC =
        TextEditingController(text: 'admin@gmai.com');
    final TextEditingController passC = TextEditingController(text: '1234567');
    final AuthController authC = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailC,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => TextField(
              controller: passC,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: controller.isHidden.value,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.isHidden.toggle();
                    },
                    icon: Icon(controller.isHidden.isFalse
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined)),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.isLoading.isFalse) {
                if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
                  controller.isLoading(true);
                  Map<String, dynamic> hasil =
                      await authC.login(emailC.text, passC.text);
                  controller.isLoading(false);
                  if (hasil['error'] == true) {
                    Get.snackbar('Error', hasil['message']);
                  } else {
                    Get.offAllNamed(Routes.HOME);
                  }
                } else {
                  Get.snackbar('Error', 'Error email or password');
                }
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: Obx(
                () => Text(controller.isLoading.isFalse ? 'Login' : 'loading')),
          ),
        ],
      ),
    );
  }
}
