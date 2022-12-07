import 'package:calculator_project/controller/home_controller.dart';
import 'package:calculator_project/core/app_constance.dart';
import 'package:calculator_project/presentation_layer/widgets/dark_light_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            DarkAndLightWidget(
              darkMode: provider.darkMode,
              darkOnPressed: () {
                provider.darkModeFun();
              },
              lightOnPressed: () {
                provider.lightModeFun();
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
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          provider.result?.toStringAsFixed(3) ?? "",
                          style: Theme.of(context).textTheme.displayLarge,
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
