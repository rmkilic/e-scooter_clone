import 'dart:ui';

import 'package:e_scooter/constant/cons_colors.dart';
import 'package:e_scooter/core/extension/context_extension.dart';
import 'package:e_scooter/enums/animation_enums.dart';
import 'package:e_scooter/enums/icon_enums.dart';
import 'package:e_scooter/models/scooter_model.dart';
import 'package:flutter/material.dart';

part 'painter/_custom_painter.dart';
part 'widget/_bottom_sheet.dart';
part 'widget/_price_bottom_sheet.dart';
class ScooterView extends StatelessWidget {
  const ScooterView({super.key, required this.data});
  final ScooterModel data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar : true,
        appBar: _appbar(context),
        body: _stack(context),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: ()=> Navigator.pop(context),
        child: Icon(IconEnums.circleArrowLeft.icon, size: 40,)),
    );
  }

  Widget _stack(BuildContext context)
  {
    return Stack(
    children: [
      _customPainter(context),
      _blurEffect(),
      _body(context),
      _bottomSheet(context)
    ],
);

  }

  _customPainter(BuildContext context)
  {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: GreenBackgroundPainter(),
    );
  }

  _blurEffect()
  {
    return  Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: Container(
              color: Colors.transparent, 
            ),
          ),
        );
  }

  _body(BuildContext context)
  {
    return Column(
      children: [
        SizedBox(height: kToolbarHeight/2,),
        SizedBox(
          height: 300,
          width: context.screenWidth,
          child: FittedBox(
            fit: BoxFit.contain,
            child: data.image.imageWidget,
          ),
        ),
        Expanded(
          child: SizedBox()
        )
      ],
    );
  }

  _bottomSheet(BuildContext context)
  {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _BottomSheet(data: data)
);
  }
}