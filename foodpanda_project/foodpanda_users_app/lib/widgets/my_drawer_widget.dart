// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodpanda_users_app/global/global.dart';

import '../authentication/auth_screen.dart';
import 'drawer_title_widget.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children: [
          // header drawer
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
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
          ),
          const SizedBox(
            height: 12,
          ),
          // body drawer
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                DrawerTitleWidget(
                  title: 'Home',
                  iconData: Icons.home,
                  onTap: () {},
                ),
                DrawerTitleWidget(
                  title: 'Order',
                  iconData: Icons.reorder,
                  onTap: () {},
                ),
                DrawerTitleWidget(
                  title: 'History',
                  iconData: Icons.access_time,
                  onTap: () {},
                ),
                DrawerTitleWidget(
                  title: 'Search',
                  iconData: Icons.search,
                  onTap: () {},
                ),
                DrawerTitleWidget(
                  title: 'Add New Address',
                  iconData: Icons.add_location,
                  onTap: () {},
                ),
                DrawerTitleWidget(
                  title: 'Sign Out',
                  iconData: Icons.exit_to_app,
                  onTap: () {
                    firebaseAuth.signOut().then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(),
                            ),
                          ),
                        );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
