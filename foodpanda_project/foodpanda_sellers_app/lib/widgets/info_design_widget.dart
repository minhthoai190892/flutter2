// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_sellers_app/global/global.dart';

import 'package:foodpanda_sellers_app/model/menus_model.dart';

class InfoDesignWidget extends StatelessWidget {
  const InfoDesignWidget({
    Key? key,
    required this.model,
    required this.context,
    required this.onTap,
  }) : super(key: key);
  final Menus? model;
  
  final BuildContext context;
  final VoidCallback onTap;
  deleteMenu({required String menuId}) {
    firebaseFirestore
        .collection('sellers')
        .doc(sharedPreferences!.getString('uid'))
        .collection('menus')
        .doc(menuId)
        .delete().then((value) {
          
        });
    Fluttertoast.showToast(msg: 'Menu deleted successfully');
  }

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
                model!.thumbnail,
                fit: BoxFit.cover,
                // height: 265,
                // width: size.width,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model!.menuTitle,
                    style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 20,
                        fontFamily: 'TrainOne'),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteMenu(menuId: model!.menuId);
                    },
                    icon: const Icon(
                      Icons.delete_sweep,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
     
            ],
          ),
        ),
      ),
    );
  }
}
