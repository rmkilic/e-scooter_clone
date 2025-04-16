import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum IconEnums
{
  circleArrowLeft(icon: CupertinoIcons.arrow_left_circle),
  arrowRight(icon: FontAwesomeIcons.arrowRight),
  locationArrow(icon: FontAwesomeIcons.locationArrow),
  speed(icon: Icons.speed),
  battery(icon: FontAwesomeIcons.batteryThreeQuarters),
  road(icon: FontAwesomeIcons.road),
  payment(icon: Icons.payment_outlined),
  favorite(icon: Icons.favorite);
  const IconEnums({
    required this.icon
  });
  final IconData icon;
}