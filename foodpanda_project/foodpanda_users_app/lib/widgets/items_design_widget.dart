// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodpanda_users_app/models/items_model.dart';
import 'package:foodpanda_users_app/models/sellers_model.dart';

class ItemsDesignWidget extends StatelessWidget {
  const ItemsDesignWidget({
    Key? key,
    this.model,
    required this.context,
    this.onTap,
  }) : super(key: key);
  final ItemsModel? model;
  final BuildContext context;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          // height: 265,
          width: size.width,
          child: Column(
            children: [
              const Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey,
              ),
              Image.network(
                model!.thumbnailUrl,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model!.sellerName,
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: 'TrainOne'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model!.shortInfo,
                style: const TextStyle(
                    color: Colors.grey, fontSize: 12, fontFamily: 'TrainOne'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
