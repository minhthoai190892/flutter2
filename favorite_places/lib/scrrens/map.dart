// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:favorite_places/model/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScrren extends StatefulWidget {
  const MapScrren({
    Key? key,
    required this.location,
    this.isSelecting = true,
  }) : super(key: key);
  final PlaceLocation location;
  final bool isSelecting;
  @override
  State<MapScrren> createState() => _MapScrrenState();
}

class _MapScrrenState extends State<MapScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'Your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(onPressed: () {}, icon: const Icon(Icons.save))
        ],
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.location.latitude,
              widget.location.longitude,
            ),
            zoom: 16,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('m1'),
              position: LatLng(
                widget.location.latitude,
                widget.location.longitude,
              ),
            ),
          },
        ),
      ),
    );
  }
}
