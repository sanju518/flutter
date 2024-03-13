import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapSample extends StatefulWidget {
  final double long;
  final double lat;
  const MapSample({super.key, required this.lat, required this.long});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  Set<Marker> _marker = {};
  @override
  void initState() {
    setState(() {
      _marker.add(Marker(markerId: MarkerId('1'),
          infoWindow: InfoWindow(title: 'MindRisers'),
          position: LatLng(widget.lat, widget.long)));
    });
    super.initState();
  }

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _marker,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.long),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

// Future<void> _goToTheLake() async {
//   final GoogleMapController controller = await _controller.future;
//   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// }
}