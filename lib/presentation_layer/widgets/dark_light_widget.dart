import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/app_constance.dart';

class DarkAndLightWidget extends StatelessWidget {
  const DarkAndLightWidget({
    Key? key,
    required this.darkMode,
    required this.darkOnPressed,
    required this.lightOnPressed,
  }) : super(key: key);

  final bool darkMode;
  final Function() darkOnPressed;
  final Function() lightOnPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 130.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButtonWidget(
              onPressed: lightOnPressed,
              iconColor: darkMode? const Color(0xff6D7078) :Colors.white,
              icon: Icons.light_mode_rounded,
            ),
            IconButtonWidget(
              onPressed: darkOnPressed,
              iconColor: darkMode? Colors.white : const Color(0xff6D7078),
              icon: FontAwesomeIcons.moon,
            ),
          ],
        ),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.iconColor,
      required this.icon})
      : super(key: key);

  final Function() onPressed;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
