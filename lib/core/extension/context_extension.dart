import 'package:flutter/material.dart';

extension BuildContextExtension<T> on BuildContext
{

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  TextTheme get textThem => Theme.of(this).textTheme;


}