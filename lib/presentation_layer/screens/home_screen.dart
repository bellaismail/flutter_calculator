import 'package:calculator_project/controller/home_controller.dart';
import 'package:calculator_project/core/app_constance.dart';
import 'package:calculator_project/presentation_layer/widgets/dark_light_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var provider = Provider.of<HomeController>(context, listen: false);
    provider.getModeFromSP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int horizontalIndex = 0;
    int verticalIndex = 0;
    int bottomIndex = 0;
    int numberIndex = 0;
    TextStyle textStyleTheme = Theme.of(context).textTheme.labelSmall!;
    var provider = Provider.of<HomeController>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20.0),
            FutureBuilder(
              future: provider.getModeFromSP(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return DarkAndLightWidget(
                    darkMode: snapshot.data,
                    darkOnPressed: () {
                      provider.darkModeFun();
                    },
                    lightOnPressed: () {
                      provider.lightModeFun();
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Consumer<HomeController>(
              builder: (context, provider, child) => Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Expanded(child: SizedBox()),
                        Text(
                          provider.formula,
                          style: provider.result == null
                              ? Theme.of(context).textTheme.displayLarge
                              : Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          provider.result?.toStringAsFixed(3) ?? "",
                          style: provider.result == null
                              ? Theme.of(context).textTheme.displayMedium
                              : Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.only(top: 30.0, right: 10.0, left: 10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    dynamic text;
                    if ((index + 1) % 4 == 0) {
                      text = AppConstance.horizontalList[horizontalIndex];
                      horizontalIndex++;
                      textStyleTheme = Theme.of(context).textTheme.labelLarge!;
                    } else if (index + 1 < 4) {
                      text = AppConstance.verticalList[verticalIndex];
                      verticalIndex++;
                      textStyleTheme = Theme.of(context).textTheme.labelMedium!;
                    } else if (index + 1 == 17 ||
                        index + 1 == 18 ||
                        index + 1 == 19) {
                      text = AppConstance.bottomList[bottomIndex];
                      textStyleTheme = Theme.of(context).textTheme.labelSmall!;
                      bottomIndex++;
                    } else {
                      text = AppConstance.numberList[numberIndex];
                      textStyleTheme = Theme.of(context).textTheme.labelSmall!;
                      numberIndex++;
                    }
                    return ButtonWidget(
                      text: "$text",
                      textStyleTheme: textStyleTheme,
                      onTapFun: () {
                        provider.onPressed(text);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
