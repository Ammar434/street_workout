import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'component/default_map_position.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: specify['name'],
        snippet: specify['address'],
      ),
    );
    debugPrint(specify['name'].toString());
    setState(() {
      markers[markerId] = marker;
    });
  }

  getParcsData() async {
    firestore.collection('allParcsData').get().then(
      (value) {
        if (value.docs.isNotEmpty) {
          for (int i = 0; i < value.docs.length; i++) {
            initMarker(
              value.docs[i].data(),
              value.docs[i].id,
            );
          }
        }
      },
    );
  }

  @override
  void initState() {
    getParcsData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        gestureRecognizers: Set()
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
        markers: Set<Marker>.of(markers.values),
        rotateGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
          String value = await DefaultAssetBundle.of(context)
              .loadString('assets/maps/map_template.json');
          controller.setMapStyle(value);
        },
      ),
    );
  }
}
