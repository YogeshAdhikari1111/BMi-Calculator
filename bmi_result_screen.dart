import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/widgets/bottom_button_widget.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';

class BMIResult extends StatelessWidget {
  final String bmi;
  final String bmiResult;
  final String bmiNarration;
  const BMIResult(
      {Key? key,
      required this.bmi,
      required this.bmiResult,
      required this.bmiNarration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BMI Calculator'),
      //   leading: const Icon(Icons.health_and_safety),
      //   backgroundColor: kBackgroundColor,
      // ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text('YOUR RESULT',
                    style: TextStyle(
                        fontSize: 40,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardControl(
                  bgcolor: kCardActiveBackground,
                  cardChild: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        bmiResult,
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        bmi,
                        style:
                            const TextStyle(fontSize: 60, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Normal BMI Range',
                        style: klabelSubheaderTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '18.5 - 24.9',
                        style: klabelSubheaderTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        bmiNarration,
                        style: klabelTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  onPress: () => {}),
            ),
            Expanded(
              child: BottomButton(
                  buttonText: 'RE-CALCULATE YOUR BMI',
                  onTap: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
