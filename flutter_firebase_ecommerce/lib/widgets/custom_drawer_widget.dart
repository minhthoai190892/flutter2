// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/welcome_screen.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        backgroundColor: AppConstant.appSecondoryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        child: Wrap(
          spacing: 10,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Waris',
                  style: AppConstant.textStyleWhite,
                ),
                subtitle: Text(
                  'Version 1.1',
                  style: AppConstant.textStyleWhite,
                ),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppConstant.appMainColor,
                  child: Text(
                    'w',
                    style: AppConstant.textStyleWhite,
                  ),
                ),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
              thickness: 1.5,
            ),
            const TitleDrawerWidget(title: 'Home', leadingIcon: Icons.home),
            const TitleDrawerWidget(
                title: 'Products',
                leadingIcon: Icons.production_quantity_limits),
            const TitleDrawerWidget(
                title: 'Order', leadingIcon: Icons.shopping_bag),
            const TitleDrawerWidget(title: 'Contact', leadingIcon: Icons.help),
            TitleDrawerWidget(
              title: 'Logout',
              leadingIcon: Icons.logout,
              onTap: () {
           
                GoogleSignIn googleSignIn = GoogleSignIn();
                FirebaseAuth auth = FirebaseAuth.instance;
                googleSignIn.signOut();
                auth.signOut();
                Get.offAll(() => WelcomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TitleDrawerWidget extends StatelessWidget {
  const TitleDrawerWidget({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward,
    this.onTap,
  }) : super(key: key);
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(
            title,
            style: AppConstant.textStyleWhite,
          ),
          leading: Icon(
            leadingIcon,
            color: AppConstant.appTextColor,
          ),
          trailing: Icon(
            trailingIcon,
            color: AppConstant.appTextColor,
          ),
        ),
      ),
    );
  }
}
