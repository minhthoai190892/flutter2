// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:favorite_places/scrrens/places_detail.dart';
import 'package:flutter/material.dart';

import '../model/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    Key? key,
    required this.places,
  }) : super(key: key);
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlacesDetailScreen(place: places[index]),
              ),
            );
          },
          title: Text(
            places[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        );
      },
    );
  }
}
