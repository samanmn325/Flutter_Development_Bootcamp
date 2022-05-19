import 'package:flutter/material.dart';
import 'package:test_app2/constant.dart';

class IconContent extends StatelessWidget {

  IconContent({this.icon,this.label}) ;

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label!,style: kTextStyle,),
        Icon(icon,size: 100.0,color: Colors.white,)
      ],
    );
  }
}