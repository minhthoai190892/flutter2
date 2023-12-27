import 'package:flutter/material.dart';
import 'package:instagram_flutter/widgets/follow_button_widget.dart';

import '../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('username'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1670873033664-023b830d17d2?q=80&w=1372&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  radius: 40,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatColumn(num: 20, label: 'posts'),
                          buildStatColumn(num: 20, label: 'followers'),
                          buildStatColumn(num: 20, label: 'following'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // padding: const EdgeInsets.only(top: 2),
                        alignment: Alignment.center,
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          color: mobileBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Edit Profile'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 15),
            child: const Text(
              'username',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 1),
            child: const Text(
              'Description',
            ),
          ),
          const Divider()
        ],
      ),
    );
  }

  Column buildStatColumn({required int num, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$num',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
