import 'package:flutter/material.dart';
import 'package:test_app2/calculator_brain.dart';
import 'package:test_app2/components/bottom_button.dart';
import 'package:test_app2/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app2/components/icon_content.dart';
import 'package:test_app2/screens/result_page.dart';
import 'package:test_app2/components/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late int weight = 60;
  late int height = 180;
  late int age = 18;
  late Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      myColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        label: 'Male',
                        icon: FontAwesomeIcons.mars,
                      ),
                    )),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  myColor: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    label: 'Female',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            myColor: kActiveCardColor,
            cardChild: Column(
              children: [
                Text(
                  'Height',
                  style: kTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kTextStyle,
                    )
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    })
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ReusableCard(
                  myColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kTextStyle,
                      ),
                      Text(weight.toString(),style: kNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  myColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: kTextStyle,
                      ),
                      Text(age.toString(),style: kNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(onPress: (){
          CalculatorBrain c = CalculatorBrain(weight: weight,height: height);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(bmiResult: c.calculateBMI(),resultText: c.getResult() ,interpretation: c.getInterpretation(),)));
        },label: 'Calculate',),
      ],
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  final IconData? icon;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F4E),
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
    );
  }
}
