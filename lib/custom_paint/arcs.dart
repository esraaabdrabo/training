import 'dart:math';

import 'package:flutter/material.dart';

class Arcs extends StatelessWidget {
  const Arcs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height),
          painter: CustomArcPainter(arcLengthList: getArcLength()),
        ),
      ),
    );
  }

  getArcLength() {
    int totalNumber = 50;
    List<double> statusNumber = [20, 18, 0, 13, 39];
    List<double> lengths = [];
    for (var i = 0; i < statusNumber.length; i++) {
      if (statusNumber[i] == 0) {
        lengths.add(25);
      } else {
        lengths.add(8.7 - ((statusNumber[i] / totalNumber) * 6));
      }
      //if the result > 3 it means that this arc will be short
      //if it less than 1  then 3.14 / result will be a big number
      //so we will set this to be small arc be sitting the value to
      // large number (10 , 9 ,8)
      //else if means that this arc will be long
    }
    print(lengths.toString());
    return lengths;
  }
}

class CustomArcPainter extends CustomPainter {
  List<double> arcLengthList;
  CustomArcPainter({required this.arcLengthList});
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
        center: Offset(size.width * .5, size.height * .5),
        width: size.width * .8,
        height: size.height * .8);
    List<Color> arcColorList = [
      const Color.fromRGBO(244, 67, 54, 1),
      Colors.yellow,
      Colors.teal,
      Colors.green,
      Colors.indigo,
    ];
    double previousLength = 0;
    for (var i = 0; i < arcLengthList.length; i++) {
      canvas.drawArc(
        rect,
        3 * 3.14 / 2 + previousLength + .08 * i,
        3.14 / arcLengthList[i],
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = arcColorList[i].withOpacity(.8)
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 10,
      );
      previousLength += 3.14 / arcLengthList[i];
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
