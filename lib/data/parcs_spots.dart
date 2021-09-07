import 'package:street_workout/data/machine_available.dart';

class ParcsSpots {
  ParcsSpots({
    required this.name,
    required this.image,
    required this.machineAvailable,
  });
  final String name;
  final List<String> image;
  final List<MachineAvailable> machineAvailable;
}

List<ParcsSpots> parcsSpotsList = [
  ParcsSpots(
    name: 'Le jardin des Voltiges',
    image: [
      'assets/images/image3.png',
      'assets/images/image4.png',
      'assets/images/image5.jpg',
      'assets/images/image6.jpg',
      'assets/images/image7.jpg',
      'assets/images/image8.jpg',
    ],
    machineAvailable: [
      machineAvailable1,
      machineAvailable2,
      machineAvailable3,
      machineAvailable4
    ],
  ),
  ParcsSpots(
    name: 'Galathée Deuil',
    image: ['assets/images/image2.PNG'],
    machineAvailable: [
      machineAvailable5,
      machineAvailable6,
      machineAvailable4,
    ],
  ),
];
