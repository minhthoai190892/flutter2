import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiktok_flutter/constraint.dart';
import 'package:tiktok_flutter/views/widgets/custom_icon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIdx],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIdx = value;
          });
        },
        currentIndex: pageIdx,
        backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: CustomIconWidget(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
