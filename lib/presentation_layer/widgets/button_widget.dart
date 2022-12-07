import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale_button/scale_button.dart';

import '../../core/app_constance.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onTapFun,
    required this.textStyleTheme,
  }) : super(key: key);

  final dynamic text;
  final Function() onTapFun;
  final TextStyle textStyleTheme;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      duration: const Duration(milliseconds: 200),
      bound: 0.3,
      onTap: onTapFun,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Theme.of(context).highlightColor,
        ),
        alignment: Alignment.center,
        child: text == "removeLastItem"
            ? Icon(
                FontAwesomeIcons.arrowLeft,
                color: Theme.of(context).textTheme.labelSmall!.color,
              )
            : Text(
                text,
                style: textStyleTheme,
              ),
      ),
    );
  }
}
