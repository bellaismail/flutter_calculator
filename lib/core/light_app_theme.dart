
import 'package:calculator_project/core/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LightAppTheme {
  static ThemeData lightAppThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppConstance.lightBackground,
      highlightColor: AppConstance.lightButtonColor,
      primaryColor: AppConstance.lightBottomBackground,
      textTheme: TextTheme(
        //formula and result
        displayLarge: GoogleFonts.kdamThmor(
          letterSpacing: 1,
          fontSize: 50.0,
          fontWeight: FontWeight.w900,
          color: AppConstance.lightText,
        ),
        displayMedium: GoogleFonts.kdamThmor(
          letterSpacing: 2,
          fontSize: 22.0,
          fontWeight: FontWeight.w900,
          color: AppConstance.lightText,
        ),

        //button colors
        labelSmall: GoogleFonts.nerkoOne(
          color: AppConstance.lightText,
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
      ),
    );
  }
}
