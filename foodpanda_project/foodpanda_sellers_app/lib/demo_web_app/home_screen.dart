import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/demo_web_app/users/all_block_users_screen.dart';
import 'package:foodpanda_sellers_app/demo_web_app/users/all_verified_users_screen.dart';
import 'package:foodpanda_sellers_app/global/global.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String timeText = '';
  String dateText = '';

  @override
  void initState() {
    super.initState();
    // time
    timeText = formatCurrentLiveTime(DateTime.now());
    dateText = formatCurrentDate(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);
    if (mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat('hh:mm:ss a').format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat('dd MMMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.cyan, Colors.amber],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1, 0),
                stops: [0, 1],
                tileMode: TileMode.clamp),
          ),
        ),
        title: const Text(
          'Welcome to Admin Web Portal',
          style: TextStyle(fontSize: 20, letterSpacing: 3, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$timeText \n $dateText',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            // user ALL VERIFIED and All Blocked accounts button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // active
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllVeriedUsersScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  label: Text(
                    'ALL VERIFIED Users \nAccount'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllBlockUsersScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.block_flipped,
                    color: Colors.white,
                  ),
                  label: Text(
                    'All Blocked Users \nAccount'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // sellers ALL VERIFIED and All Blocked accounts button ui

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // active
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  label: Text(
                    'ALL VERIFIED Sellers \nAccount'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.block_flipped,
                    color: Colors.white,
                  ),
                  label: Text(
                    'All Blocked Sellers \nAccount'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            // Riders ALL VERIFIED and All Blocked accounts button ui

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // active
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  label: Text(
                    'ALL VERIFIED Riders \nAccount'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.block_flipped,
                    color: Colors.white,
                  ),
                  label: Text(
                    'All Blocked Riders \nAccount'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(
                'Logout'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
