import 'package:flutter/material.dart';

enum ImageEnums
{
  locaiton(name:"img_location"),
  marker(name: "img_marker"),
  rainy(name: "img_rainy"),
  logo(name: "img_logo"),
  matteBlack(name: "img_scooter_matteblack"),
  scooter1(name: "img_scooter1"),
  scooter2(name: "img_scooter2"),
  scooter3(name: "img_scooter3"),
  scooter4(name: "img_scooter4"),
  scooter5(name: "img_scooter5"),
  scooter6(name: "img_scooter6"),
  scooter7(name: "img_scooter7"),
  scooter8(name: "img_scooter8");

  const ImageEnums({required this.name});
  final String name;
}

extension ImageExtension on ImageEnums{

  String get toPath => 'assets/images/$name.png';

  Widget get imageWidget => Image.asset(toPath);



}