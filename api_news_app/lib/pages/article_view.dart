// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({
    Key? key,
    required this.blogUrl,
  }) : super(key: key);
  final String blogUrl;
  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    var url = widget.blogUrl;

    WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: WebViewWidget(controller: controller)),
    );
  }
}
