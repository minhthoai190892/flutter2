// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/main_screen/items_screens.dart';

import 'package:foodpanda_users_app/models/menus_model.dart';

class MenusDesignWidget extends StatelessWidget {
  const MenusDesignWidget({
    Key? key,
    required this.model,
    required this.context,
    this.onTap,
  }) : super(key: key);
  final MenusModel model;
  final BuildContext context;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsScreen(model: model),
          )),
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
                model.thumbnail,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.menuTitle,
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: 'TrainOne'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.menuInfo,
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
