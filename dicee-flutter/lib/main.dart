import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int l=1,r=1;
  void changeDiceFace(){
    setState(() {
      l = Random().nextInt(6) + 1;
      r = Random().nextInt(6) + 1;
    });
  }
  @override

  Widget build(BuildContext context) {
    return Center(
      child: Row(

        children: [
          Expanded(child: FlatButton(onPressed:(){
            changeDiceFace();
            print('left button is pressed');
          },child: Image.asset('images/dice$l.png'),),),
          Expanded(child: FlatButton(onPressed: (){
            changeDiceFace();
          },child: Image.asset('images/dice$r.png'))),
        ],
      ),
    );
  }
}
