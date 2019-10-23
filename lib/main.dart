import 'dart:math';
import 'dart:ui' as prefix0;

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

class DicePage extends StatefulWidget {

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin {
  int _left = 1;
  int _right = 1;
  int introAnimationCount = 0;
  Animation<double> introAnimation;
  Animation<double> tapAnimation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    );

    introAnimation = Tween<double>(begin: 0.0, end: 200.0).animate(controller)
                ..addStatusListener((status) {
                  if (status == AnimationStatus.completed && introAnimationCount != 2) {
                    controller.reverse();
                  } else if (status == AnimationStatus.dismissed) {
                    controller.forward();
                    introAnimationCount++;
                  }
                  if (introAnimationCount == 2) {
                    tapAnimation = CurvedAnimation (parent: controller, curve: Curves.bounceIn);
                  }
                })
                ..addListener((){ setState(() {}); });

    controller.forward();
  }

  void indexUpdate() {
    _left = Random().nextInt(6) + 1;
    _right = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row (
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$_left.png',
                height: introAnimation.value,
                width: introAnimation.value
              ),
              onPressed: () {
                setState(() {
                  indexUpdate();
                  controller.forward();
                });
              }
            ),
          ),
          SizedBox (width: 10.0),
          Expanded (
            child: FlatButton(
              child: Image.asset(
                  'images/dice$_right.png',
                  height: introAnimation.value,
                  width: introAnimation.value
              ),
              onPressed: () {
                setState(() {
                  indexUpdate();
                  controller.forward();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


}
