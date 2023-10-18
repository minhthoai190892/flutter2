// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:favorite_places/model/place.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({
    Key? key,
    required this.place,
  }) : super(key: key);
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            place.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}