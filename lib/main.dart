import 'package:calculator_project/controller/home_controller.dart';
import 'package:calculator_project/core/app_constance.dart';
import 'package:calculator_project/core/light_app_theme.dart';
import 'package:calculator_project/presentation_layer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/dark_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool? darkMode;
  Future<void> getModeFromSP() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    darkMode = sp.getBool(AppConstance.mode)??false;
  }
  @override
  void initState() {
    getModeFromSP();
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Provider.of<HomeController>(context).darkMode
            ? DarkAppTheme.darkAppThemeData()
            : LightAppTheme.lightAppThemeData(),
        home: const HomeScreen(),
      ),
    );
  }
}
