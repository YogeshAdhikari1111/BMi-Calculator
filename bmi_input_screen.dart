import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/bmi_result_screen.dart';
import 'package:flutter_application_1/services/bmi_calculate_service.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/widgets/bottom_button_widget.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';
import 'package:flutter_application_1/widgets/icon_widget.dart';
import 'package:flutter_application_1/widgets/rounded_icon_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderType { Male, Female }

class BMIInputPage extends StatefulWidget {
  const BMIInputPage({Key? key}) : super(key: key);

  @override
  State<BMIInputPage> createState() => _BMIInputPageState();
}

class _BMIInputPageState extends State<BMIInputPage> {
  GenderType selectedGender = GenderType.Male;
  double height = 180;
  int age = 24;
  double weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        leading: const Icon(Icons.health_and_safety),
        backgroundColor: kBackgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardControl(
                        bgcolor: selectedGender == GenderType.Male
                            ? kCardActiveBackground
                            : kCardInActiveBackground,
                        cardChild: const IconControl(
                            iconData: FontAwesomeIcons.person,
                            iconText: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.Male;
                          });
                        }),
                  ),
                  Expanded(
                    child: CardControl(
                        bgcolor: selectedGender == GenderType.Female
                            ? kCardActiveBackground
                            : kCardInActiveBackground,
                        cardChild: const IconControl(
                            iconData: FontAwesomeIcons.personDress,
                            iconText: 'FEMALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.Female;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardControl(
                  bgcolor: kCardInActiveBackground,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('HEIGHT', style: klabelSubheaderTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toStringAsFixed(1),
                              style: klabelNumberTextStyle),
                          const Text('cm', style: klabelTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: kSliderActiveColor,
                            inactiveTrackColor: kSliderInactiveColor,
                            trackShape: const RectangularSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbColor: kSliderThumbColor,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12.0),
                            overlayColor: kSliderThumbColor.withAlpha(60),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 28.0)),
                        child: Slider(
                            value: height,
                            min: 100.0,
                            max: 250.0,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue;
                              });
                            }),
                      )
                    ],
                  ),
                  onPress: () {}),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: CardControl(
                      bgcolor: kCardInActiveBackground,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT', style: klabelSubheaderTextStyle),
                          const SizedBox(height: 5),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Row(children: [
                            Expanded(
                              child: RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ),
                            const SizedBox(height: 5),
                          ])
                        ],
                      ),
                      onPress: () {}),
                ),
                Expanded(
                  child: CardControl(
                      bgcolor: kCardInActiveBackground,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5),
                          const Text('AGE', style: klabelSubheaderTextStyle),
                          Text(
                            '$age',
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Row(children: [
                            Expanded(
                              child: RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 0) age--;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ),
                          ]),
                          const SizedBox(height: 5),
                        ],
                      ),
                      onPress: () {}),
                ),
              ]),
            ),
            BottomButton(
                buttonText: 'CALCULATE BMI',
                onTap: () {
                  var bmi = CalculateBMI(height, weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMIResult(
                              bmi: bmi.calculate(),
                              bmiResult: bmi.getResult(),
                              bmiNarration: bmi.getNarration())));
                }),
          ],
        ),
      ),
    );
  }
}
