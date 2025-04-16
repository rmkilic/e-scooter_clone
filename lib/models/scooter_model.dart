import 'package:e_scooter/enums/animation_enums.dart';

class ScooterModel {
  final ImageEnums image;
  final String name;
  final String description;
  final int charge;
  final int speed;
  final int distance;
  final int road;
  final double spendPerMinute;
  final double price;
  final bool favorite;
  final double latitude;
  final double longitude;

  ScooterModel({
    required this.image,
    required this.name,
    this.description = "The product with a chamming title -TYPE X- is made in Germany and is described as the one that began a new era.",
    this.charge = 50,
    this.speed = 29,
    this.distance = 183,
    this.road = 19,
    this.spendPerMinute = 0.30,
    this.price = 2.59,
    this.favorite = true,
    required this.latitude,
    required this.longitude
  });
}

List<ScooterModel> dummyScooterList =
[
  ScooterModel(image: ImageEnums.scooter5, name: "Type X", charge: 65, latitude: 37.429196, longitude: -122.111882),
  ScooterModel(image: ImageEnums.scooter7, name: "Blaupunkt", spendPerMinute: 0.25, latitude: 37.429363, longitude: -122.110561),
  ScooterModel(image: ImageEnums.scooter6, name: "Cbra", spendPerMinute: 0.40, latitude: 37.429588, longitude: -122.110928),
  ScooterModel(image: ImageEnums.scooter8, name: "Onvo", charge: 65, latitude: 37.428621, longitude: -122.112438),
];