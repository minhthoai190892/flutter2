import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/profile_screen.dart';
import 'package:instagram_flutter/screens/screens.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostCreen(),
  const Center(
    child: Text('favorite'),
  ),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];
