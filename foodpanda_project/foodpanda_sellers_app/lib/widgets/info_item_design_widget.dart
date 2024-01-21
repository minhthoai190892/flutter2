// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/model/items_model.dart';


class InfoItemDesignWidget extends StatelessWidget {
  const InfoItemDesignWidget({
    Key? key,
    required this.model,
    required this.context,
    required this.onTap,
  }) : super(key: key);
  final ItemsModel model;
  final BuildContext context;
  final VoidCallback onTap;
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
              Text(
                model.title,
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: 'TrainOne'),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Image.network(
                model.thumbnailUrl,
                fit: BoxFit.cover,
                // height: 265,
                // width: size.width,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.shortInfo,
                style: const TextStyle(
                    color: Colors.grey, fontSize: 12, fontFamily: 'TrainOne'),
              ),
               const SizedBox(
                height: 10,
              ),
              Text(
                model.publishedDate.toString(),
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
