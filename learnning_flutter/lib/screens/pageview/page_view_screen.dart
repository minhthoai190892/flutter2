import 'package:flutter/material.dart';
import 'package:learnning_flutter/constants/image_manager.dart';
import 'package:learnning_flutter/screens/pageview/data/data.dart';
import 'package:learnning_flutter/screens/pageview/widget.dart/page_circle_indicator.dart';
import 'package:learnning_flutter/screens/pageview/widget.dart/page_entity_widget.dart';

import '../../widgets/app_appbar.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Page View',
      ),
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) => currentPageNotifier.value = value,
            itemCount: pages.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageEntityWidget(entity: pages[index]),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: PageCircleIndicator(
              currentPageNotifier: currentPageNotifier,
              itemCount: pages.length,
            ),
          )
        ],
      ),
    );
  }
}
