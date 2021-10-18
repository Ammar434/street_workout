import 'package:cloud_firestore/cloud_firestore.dart';

class ParcsModel {
  ParcsModel({
    required this.description,
    required this.name,
    required this.image,
    required this.machineAvailable,
    required this.location,
  });
  final String name;
  final List<dynamic> image;
  final List<dynamic> machineAvailable;
  final GeoPoint location;
  final String description;
}
