import 'package:flutter/cupertino.dart';
import 'package:test_app2/constant.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.label,required this.onPress});

  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: kBottomContainerColor,
        ),
        height: 80.0,
        width: double.infinity,
        child: Center(child: Text(label,style: kLargeButtonTextStyle,)),
      ),
    );
  }
}