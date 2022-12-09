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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      builder: (context, child) => const MaterialWidget(),
    );
  }
}

class MaterialWidget extends StatefulWidget {
  const MaterialWidget({Key? key}) : super(key: key);

  @override
  State<MaterialWidget> createState() => _MaterialWidgetState();
}

class _MaterialWidgetState extends State<MaterialWidget> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeController>(context);
    return FutureBuilder(
        future: provider.getModeFromSP(),
        builder: (context, AsyncSnapshot<bool> snapshot){
      if(snapshot.hasData){
        return Selector<HomeController, bool>(
          selector: (context, prov) => prov.darkMode,
          builder: (context, provider, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: snapshot.data!
                  ? DarkAppTheme.darkAppThemeData()
                  : LightAppTheme.lightAppThemeData(),
              home: const HomeScreen(),
            );
          },
        );
      }else{
        return const Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
