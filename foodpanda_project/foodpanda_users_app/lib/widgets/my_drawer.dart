import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/global/global.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                // header drawer
                Material(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(80),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            sharedPreferences!.getString('photoUrl')!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  sharedPreferences!.getString('name')!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Train',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
