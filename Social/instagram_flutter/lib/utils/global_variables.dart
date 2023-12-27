import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/profile_screen.dart';
import 'package:instagram_flutter/screens/screens.dart';

const webScreenSize = 600;
const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostCreen(),
  Center(
    child: Text('favorite'),
  ),
 ProfileScreen(),
];
