import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeBox extends StatelessWidget {
  final widget;

  WelcomeBox({this.widget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          width: double.infinity,
          color: Colors.blue[900],
        ),
        Positioned(
          bottom: 20.0,
          left: 10.0,
          child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
                  color: Colors.blue[500])),
        ),
        Positioned(
          bottom: 50.0,
          right: 250.0,
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: Colors.blue[200]),
          ),
        ),
        Container(
            child: widget),
      ],
    );
  }
}
