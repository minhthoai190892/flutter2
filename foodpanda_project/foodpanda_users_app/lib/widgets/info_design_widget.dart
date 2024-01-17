// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodpanda_users_app/models/sellers_model.dart';

class InfoDesignWidget extends StatelessWidget {
  const InfoDesignWidget({
    Key? key,
    required this.model,
    required this.context,
  }) : super(key: key);
  final Sellers? model;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
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
                model!.sellerAvataUrl!,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model!.sellerName!,
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: 'TrainOne'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model!.sellerEmail!,
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
