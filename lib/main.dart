import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/InputPage.dart';
import 'results.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  Color primaryColor() => Color(0xFF0A0E21);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: primaryColor()),
        scaffoldBackgroundColor: primaryColor(),
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbColor: const Color(kbottomContainerColor),
            overlayColor: const Color(0x29EB1555),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
            inactiveTrackColor: kSliderInactiveColor),
      ),
      home: InputPage(),
    );
  }
}

class RounderIconBtn extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onTap;
  const RounderIconBtn({super.key, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 6.0,
      constraints: BoxConstraints.tight(const Size(56.0, 56.0)),
      shape: const CircleBorder(),
      fillColor: const Color(0XFF4C4F5E),
      child: Icon(iconData),
    );
  }
}
