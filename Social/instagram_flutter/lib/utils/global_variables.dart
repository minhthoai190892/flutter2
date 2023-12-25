import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/screens.dart';

const webScreenSize = 600;
const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostCreen(),
  Center(
    child: Text('favorite'),
  ),
  Center(
    child: Text('person'),
  ),
];
