// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:favorite_places/model/place.dart';

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
  LatLng? _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'Your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {
                // chuyễn dữ liệu từ MapScreen sang AddPlaceScreen
                Navigator.pop(context, _pickedLocation);
              },
              icon: const Icon(Icons.save),
            )
        ],
      ),
      body: SafeArea(
        child: GoogleMap(
          // chọn vị trí trên Map
          onTap: !widget.isSelecting
              ? null
              : (position) {
                  setState(() {
                    _pickedLocation = position;
                  });
                },
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.location.latitude,
              widget.location.longitude,
            ),
            zoom: 16,
          ),
          markers: (_pickedLocation == null && widget.isSelecting)
              ? {}
              : {
                  // điểm đánh dấu
                  Marker(
                    markerId: const MarkerId('m1'),
                    position: _pickedLocation ??
                        LatLng(
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
