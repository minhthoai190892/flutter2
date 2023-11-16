// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:learnning_flutter/screens/pageview/model/page_entity.dart';

class PageEntityWidget extends StatefulWidget {
  const PageEntityWidget({
    Key? key,
    required this.entity,
  }) : super(key: key);
  final PageEntity entity;
  @override
  State<PageEntityWidget> createState() => _PageEntityWidgetState();
}

class _PageEntityWidgetState extends State<PageEntityWidget> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollToEnd(milliseconds: 1000);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      scrollToEnd(milliseconds: 1000);
      return ListView(
        controller: controller,
        children: [
          Image.asset(widget.entity.imagePath),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.entity.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.entity.description,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      );
    });
  }

  void scrollToEnd({int milliseconds = 1000}) {
    Timer(Duration(milliseconds: milliseconds), () {
      if (!controller.hasClients) {
        return;
      }
      controller.jumpTo(controller.position.maxScrollExtent);
    });
  }
}
