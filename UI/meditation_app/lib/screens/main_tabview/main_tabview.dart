import 'package:flutter/material.dart';
import 'package:meditation_app/common_widget/tabview_button_widget.dart';
import 'package:meditation_app/screens/home/home_screen.dart';

class MainTabViewScreen extends StatefulWidget {
  const MainTabViewScreen({super.key});

  @override
  State<MainTabViewScreen> createState() => _MainTabViewScreenState();
}

class _MainTabViewScreenState extends State<MainTabViewScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          const HomeScreen(),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.greenAccent,
          ),
          Container(
            color: Colors.grey,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 8),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -4))
        ]),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButtonWidget(
              icon: 'assets/images/icons8-home-100.png',
              title: 'Home',
              isSelect: selectTab == 0,
              onPressed: () {
                changeTab(index: 0);
              },
            ),
            TabButtonWidget(
              icon: 'assets/images/icons8-sleep-100.png',
              title: 'Sleep',
              isSelect: selectTab == 1,
              onPressed: () {
                changeTab(index: 1);
              },
            ),
            TabButtonWidget(
              icon: 'assets/images/icons8-meditation-16.png',
              title: 'Meditate',
              isSelect: selectTab == 2,
              onPressed: () {
                changeTab(index: 2);
              },
            ),
            TabButtonWidget(
              icon: 'assets/images/icons8-music-100.png',
              title: 'Music',
              isSelect: selectTab == 3,
              onPressed: () {
                changeTab(index: 3);
              },
            ),
            TabButtonWidget(
              icon: 'assets/images/icons8-admin-settings-male-64.png',
              title: 'Profile',
              isSelect: selectTab == 4,
              onPressed: () {
                changeTab(index: 4);
              },
            ),
          ],
        )),
      ),
    );
  }

  void changeTab({required int index}) {
    selectTab = index;
    controller?.animateTo(index);
    setState(() {});
  }
}
