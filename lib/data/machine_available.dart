class MachineAvailable {
  final String name, image;

  MachineAvailable({required this.name, required this.image});
}

Map<String, MachineAvailable> machineAvailable = {
  'traction': machineAvailable1,
  'dips': machineAvailable2,
  'mediumBar': machineAvailable3,
  'banc': machineAvailable4,
  'monkeyBar': machineAvailable5,
  'highVerticalBar': machineAvailable6,
};

MachineAvailable machineAvailable1 = MachineAvailable(
    name: "Traction", image: "assets/images/exercices/image _exercice1.png");
MachineAvailable machineAvailable2 = MachineAvailable(
    name: "Dips", image: "assets/images/exercices/image _exercice2.png");
MachineAvailable machineAvailable3 = MachineAvailable(
    name: "MediumBar", image: "assets/images/exercices/image _exercice3.png");
MachineAvailable machineAvailable4 = MachineAvailable(
    name: "Banc", image: "assets/images/exercices/image _exercice4.png");
MachineAvailable machineAvailable5 = MachineAvailable(
    name: "MonkeyBar", image: "assets/images/exercices/image _exercice5.png");
MachineAvailable machineAvailable6 = MachineAvailable(
    name: "HighVerticalBar",
    image: "assets/images/exercices/image _exercice6.png");
