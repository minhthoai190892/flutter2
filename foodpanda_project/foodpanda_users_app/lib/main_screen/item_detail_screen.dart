// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodpanda_users_app/models/items_model.dart';

import '../widgets/my_app_bar.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ItemsModel model;
  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MyAppBar(widget: widget);
  }
}
