import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/cons_colors.dart';
import '../../constant/cons_size.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            size: ConsSize.iconBig,
            color: Colors.white,
            
          ),
          
        ),
        scaffoldBackgroundColor: ConsColor.chaosBlack,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.32,
              height: 47/50
            ),
          ),
          displayMedium: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.32,
              height: 47/25
            ),
          ),
          labelLarge: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w600,   
            height: 1.215,                 
            letterSpacing: 0.0,            
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w600,   
            height: 21/30,                 
            letterSpacing: -0.32,          
            color: Colors.white
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,   
            height: 1.215,                 
            letterSpacing: 0.0,            
          ),
          titleSmall: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,   
            height: 21/15,                 
            letterSpacing: -0.32,         
            color: Colors.white
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,   
            height: 1.215,                 
            letterSpacing: 0.0,            
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,   
            height: 1.215,                
            letterSpacing: 0.0,            
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,  
            height: 1.215,                 
            letterSpacing: 0.0,           
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
      }
}
