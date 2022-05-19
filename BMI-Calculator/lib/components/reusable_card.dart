import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.myColor,this.cardChild , this.onPress});

  final Widget? cardChild;
  final Color? myColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
      child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: myColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: cardChild,),
    );
  }
}
