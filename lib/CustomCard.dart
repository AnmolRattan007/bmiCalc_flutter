import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? cardChild;
  final Color cardColor;
  final VoidCallback? viewTapped;
  CustomCard({this.cardChild, required this.cardColor, this.viewTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewTapped,
      child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardChild),
    );
  }
}
