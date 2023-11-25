// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:firebase_food_delivery_ecommerce/pages/home.dart';
import 'package:firebase_food_delivery_ecommerce/pages/order.dart';
import 'package:firebase_food_delivery_ecommerce/pages/profile.dart';
import 'package:firebase_food_delivery_ecommerce/pages/wellet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Home home;
  late Profile profile;
  late Order order;
  late Wallet wallet;
  @override
  void initState() {
    home = const Home();
    profile = const Profile();
    order = const Order();
    wallet = const Wallet();
    pages = [home, profile, order, wallet];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (value) {
          currentTabIndex = value;
        },
        items: const [
          IconTabNavigation(iconData: Icons.home_outlined),
          IconTabNavigation(iconData: Icons.shopping_bag_outlined),
          IconTabNavigation(iconData: Icons.wallet_outlined),
          IconTabNavigation(iconData: Icons.person_2_outlined),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}

class IconTabNavigation extends StatelessWidget {
  const IconTabNavigation({
    Key? key,
    required this.iconData,
  }) : super(key: key);
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: Colors.white,
    );
  }
}
