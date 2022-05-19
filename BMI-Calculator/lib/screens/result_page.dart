import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app2/components/bottom_button.dart';
import 'package:test_app2/constant.dart';
import 'package:test_app2/components/reusable_card.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult,required this.resultText,required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ReusableCard(
                cardChild: Text(
                  'your result',
                  style: kTitleTextStyle,
                ),
              )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              myColor: kInactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Text(
                        resultText,
                        style: kResultTextStyle,
                      )),
                  Center(
                      child: Text(
                        bmiResult,
                        style: kBMITextStyle,
                      )),
                  Center(
                      child: Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
          BottomButton(
            label: 're_calculate',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

