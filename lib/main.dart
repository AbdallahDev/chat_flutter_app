import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyAnimatedContainer());

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);
  bool _tap = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              final random = Random();

//              switch (_tap) {
//                case false:
//                  {
//                    _width = 100;
//                    _height = 100;
//                    _color = Colors.red;
//                    _borderRadius = BorderRadius.circular(100);
//                  }
//                  break;
//                default:
//                  {_width = 100;
//                  _height = 100;
//                  _color = Colors.red;
//                  _borderRadius = BorderRadius.circular(100);}
//              }

              //change the width and the height randomly
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              //change the color randomly
              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              //change the border radius randomly.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
          child: Icon(Icons.play_arrow),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: _width,
                  height: _height,
                  decoration:
                      BoxDecoration(color: _color, borderRadius: _borderRadius),
                  curve: Curves.fastOutSlowIn,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
