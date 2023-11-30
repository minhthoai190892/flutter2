import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_food_delivery_ecommerce/admin/home_admin.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  loginAdmin() {
    FirebaseFirestore.instance.collection('admin').get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['userName'] != userNameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Your username is not correct. Please try again',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        } else if (result.data()['password'] !=
            userPasswordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Your password is not correct. Please try again',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeAdmin(),
              ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
              width: width,
              height: height,
              margin: EdgeInsets.only(top: height / 2),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 53, 51, 5), Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius:
                    BorderRadius.vertical(top: Radius.elliptical(width, 110)),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Let's start with\n Admin!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: height / 2.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 168, 160, 147)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: 'User name',
                                          hintStyle:
                                              TextStyle(color: Colors.blueGrey),
                                          border: InputBorder.none),
                                      controller: userNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Username';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 168, 160, 147)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: 'Password',
                                          hintStyle:
                                              TextStyle(color: Colors.blueGrey),
                                          border: InputBorder.none),
                                      controller: userPasswordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () => loginAdmin(),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 12),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    width: width,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
