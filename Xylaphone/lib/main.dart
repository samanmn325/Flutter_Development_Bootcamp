import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Expanded buildKey(int a , Color color){
    return Expanded(
      child: FlatButton(
        onPressed: () {
          soundNum(a);
        },
        child: Text(''),
        color: color,
      ),
    );
  }
  void soundNum(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('sam'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(1, Colors.red),
            buildKey(2, Colors.yellow),
            buildKey(3, Colors.blue),
            buildKey(4, Colors.orange),
            buildKey(5, Colors.purple),
            buildKey(6, Colors.pink),
            buildKey(7, Colors.blueGrey),

          ],
        ),
      ),
    );
  }
}
