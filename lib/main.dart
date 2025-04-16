import 'package:e_scooter/core/theme/app_theme.dart';
import 'package:e_scooter/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, 
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Scooter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeView(),
    );
  }
}
