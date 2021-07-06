import 'package:flutter/material.dart';
import 'package:flutter_ro_test/widgets/Parts.dart';

class PartsBody extends StatelessWidget {
  final homeContext;

  const PartsBody({Key key, this.homeContext}) : super(key: key);
  @override
  Widget build(homeContext) {
    return Container(

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Parts(homeContext:homeContext),
        //createImage(),
      ),
    );
  }
}
