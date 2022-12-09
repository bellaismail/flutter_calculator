import 'package:flutter/material.dart';

class AppConstance{
  //colors
  static const Color darkBackground = Color(0xff22252D); //#22252D
  static const Color darkBottomBackground = Color(0xff2A2D37); //#363E3C  #2A2D37
  static const Color darkButtonColor = Color(0xff292C35);
  static const Color operationButtonColor1 = Color(0xff69E7D0);
  static const Color operationButtonColor2 = Color(0xffE27374);
  static const Color darkText = Color(0xffDFDEDE);

  static const Color lightBackground = Colors.white;
  static const Color lightBottomBackground = Color(0xffDFDEDE);
  static  Color lightButtonColor = Colors.grey[100]!;
  static const Color lightText = Color(0xff22252D);

  //simples
  static const List horizontalList = ["÷", "x", "-", "+", "="];
  static const List verticalList = ["AC", "+/-", "%"];
  static const List bottomList = ["removeLastItem", "0", "."];
  static const List numberList = [7, 8, 9, 4, 5, 6, 1, 2, 3];
  //theme
  static const mode = "DarkMode";
}