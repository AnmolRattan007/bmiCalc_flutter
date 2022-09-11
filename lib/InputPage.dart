import 'package:bmi_calculator/calc_brain.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CardIcon.dart';
import 'CustomCard.dart';
import 'constants.dart';
import 'results.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selctedGender;
  int sliderValue = 180;
  int weight = 60;
  int age = 19;
  Color genderViewColor(GenderType gender) =>
      gender == selctedGender ? kactiveCardColor : kinactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CustomCard(
                        viewTapped: () {
                          setState(() {
                            selctedGender = GenderType.male;
                          });
                        },
                        cardColor: genderViewColor(GenderType.male),
                        cardChild: CardIcon(
                          cardIcon: FontAwesomeIcons.mars,
                          cardText: "Male",
                        ))),
                Expanded(
                    child: CustomCard(
                        viewTapped: () {
                          setState(() {
                            selctedGender = GenderType.female;
                          });
                        },
                        cardColor: genderViewColor(GenderType.female),
                        cardChild: CardIcon(
                          cardIcon: FontAwesomeIcons.venus,
                          cardText: "Female",
                        )))
              ],
            )),
            Expanded(
                child: CustomCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Height",
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        sliderValue.toString(),
                        style: kheaderLabelTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: sliderValue.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        sliderValue = newValue.toInt();
                      });
                    },
                    min: ksliderMinValue,
                    max: ksliderMaxValue,
                  )
                ],
              ),
              cardColor: kactiveCardColor,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CustomCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: klabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kheaderLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RounderIconBtn(
                            iconData: FontAwesomeIcons.minus,
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RounderIconBtn(
                            iconData: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  cardColor: kactiveCardColor,
                )),
                Expanded(
                    child: CustomCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Age",
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kheaderLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RounderIconBtn(
                            iconData: (FontAwesomeIcons.minus),
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RounderIconBtn(
                            iconData: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  cardColor: kactiveCardColor,
                ))
              ],
            )),
            GestureDetector(
              onTap: () {
                CalcBrain calc = CalcBrain(weight: weight, height: sliderValue);
                var bmi = calc.calculate();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmi: bmi,
                              result: calc.result(),
                              interpretation: calc.getInterp(),
                            )));
              },
              child: Container(
                color: const Color(kbottomContainerColor),
                width: double.infinity,
                height: kbottomContainerHeight,
                margin: const EdgeInsets.only(top: 10.0),
                child: const Center(child: Text("CALCULATE")),
              ),
            )
          ],
        ));
  }
}
