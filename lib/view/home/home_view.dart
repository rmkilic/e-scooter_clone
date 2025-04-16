import 'package:e_scooter/constant/cons_colors.dart';
import 'package:e_scooter/enums/animation_enums.dart';
import 'package:e_scooter/enums/icon_enums.dart';
import 'package:e_scooter/view/map/mock_map_view.dart';
import 'package:flutter/material.dart';

part 'widget/_w_button.dart';
part 'widget/_w_image.dart';
part 'widget/_w_logo.dart';
part 'widget/_w_slogan.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConsColor.chaosBlack,
      body: Column(
        children: [
          SizedBox(height: 65,),
          _WLogo(),
          SizedBox(height: 27,),
          _WImage(),
          _WSlogan(),
          Spacer(),
          _WButton(),
          Spacer()
        ],
      ),
    );
  }


}