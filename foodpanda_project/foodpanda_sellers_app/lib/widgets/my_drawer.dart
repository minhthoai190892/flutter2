// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/main_screen/earning_screen.dart';
import 'package:foodpanda_sellers_app/main_screen/history_screen.dart';
import 'package:foodpanda_sellers_app/main_screen/new_orders_screen.dart';

import '../authentication/auth_screen.dart';
import '../global/global.dart';
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
                  title: 'My Earnings',
                  iconData: Icons.monetization_on,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EarningsScreen(),
                        ));
                  },
                ),
                DrawerTitleWidget(
                  title: 'New Order',
                  iconData: Icons.reorder,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewOrdersScreen(),
                        ));
                  },
                ),
                DrawerTitleWidget(
                  title: 'History - Orders',
                  iconData: Icons.local_shipping,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryScreen(),
                        ));
                  },
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
