import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/CustomCard.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;
  const ResultsPage(
      {super.key,
      required this.bmi,
      required this.result,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Results",
                style: kheaderLabelTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: CustomCard(
              cardColor: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    bmi,
                    style: const TextStyle(
                        fontSize: 88.0, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: const Color(kbottomContainerColor),
                child: const Center(
                  child: Text(
                    "RE-CALCULATE",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
