import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/utils.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped({required int page}) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  void onPageChanged(int value) {
    setState(() {
      _page = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          'assets/images/ic_instagram.svg',
          color: primaryColor,
          height: 32,
        ),
        actions: [
          IconButton(
              onPressed: () => navigationTapped(page: 0),
              icon: Icon(Icons.home,
                  color: _page == 0 ? primaryColor : secondaryColor)),
          IconButton(
              onPressed: () => navigationTapped(page: 1),
              icon: Icon(Icons.search,
                  color: _page == 1 ? primaryColor : secondaryColor)),
          IconButton(
              onPressed: () => navigationTapped(page: 2),
              icon: Icon(Icons.add_a_photo,
                  color: _page == 2 ? primaryColor : secondaryColor)),
          IconButton(
              onPressed: () => navigationTapped(page: 3),
              icon: Icon(Icons.favorite,
                  color: _page == 3 ? primaryColor : secondaryColor)),
          IconButton(
              onPressed: () => navigationTapped(page: 4),
              icon: Icon(Icons.person,
                  color: _page == 4 ? primaryColor : secondaryColor)),
        ],
      ),
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
