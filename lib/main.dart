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
        body: SafeArea(
          child: DicePage(),
        ),
      ),
    ),
  );
}

int imgIndex() {
  return Random().nextInt(6);
}

class DicePage extends StatefulWidget {

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _left = 1;
  int _right = 1;

  void indexUpdate() {
    _left = imgIndex()+1;
    _right = imgIndex()+1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row (
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$_left.png'),
              onPressed: () {
                setState(() {
                  indexUpdate();
                });
              }
            ),
          ),
          SizedBox (width: 10.0),
          Expanded (
            child: FlatButton(
              child: Image.asset('images/dice$_right.png'),
              onPressed: () {
                setState(() {
                  indexUpdate();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
