import 'dart:async';

import 'package:flutter/material.dart';
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
            // user activate and block accounts button ui
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
                    'Activate Users \nAccount'.toUpperCase(),
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
                    'Block Users \nAccount'.toUpperCase(),
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
            // sellers activate and block accounts button ui

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
                    'Activate Sellers \nAccount'.toUpperCase(),
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
                    'Block Sellers \nAccount'.toUpperCase(),
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
            // Riders activate and block accounts button ui

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
                    'Activate Riders \nAccount'.toUpperCase(),
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
                    'Block Riders \nAccount'.toUpperCase(),
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
              onPressed: () {},
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
