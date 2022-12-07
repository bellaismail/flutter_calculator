
import 'package:calculator_project/core/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkAppTheme{
  static ThemeData darkAppThemeData(){
    return ThemeData(
      primaryColor: AppConstance.darkBottomBackground,
      highlightColor: AppConstance.darkBackground,
      scaffoldBackgroundColor: AppConstance.darkBackground,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.kdamThmor(
          letterSpacing: 1,
          fontSize: 50.0,
          fontWeight: FontWeight.w900,
          color: AppConstance.darkText,
        ),
        displayMedium: GoogleFonts.kdamThmor(
          letterSpacing: 2,
          fontSize: 22.0,
          fontWeight: FontWeight.w900,
          color: AppConstance.darkText,
        ),

        //button colors
        labelSmall: GoogleFonts.nerkoOne(
          color: AppConstance.darkText,
          fontSize: 30.0,
        ),
        labelMedium: GoogleFonts.nerkoOne(
          color: AppConstance.operationButtonColor1,
          fontSize: 30.0,
        ),
        labelLarge: GoogleFonts.nerkoOne(
          color: AppConstance.operationButtonColor2,
          fontSize: 30.0,
        ),
      )
    );
  }
}