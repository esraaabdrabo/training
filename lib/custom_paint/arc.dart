import 'dart:developer';

import 'package:flutter/material.dart';

class CustomArc extends StatelessWidget {
  const CustomArc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: ArcPainter(),
          size: Size(MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rec = Rect.fromCenter(
        center: Offset(size.width * .5, size.height * .5),
        width: size.width * .8,
        height: size.height * .8);
    canvas.drawRect(
        rec,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);

    //first arc start from 3.14
    //second start from 3.14 + (length of the previous arc) + (white space .025 * number of i)
    double perviousLength = 0; //3.14 / 3
    List<int> arcLengths = [5, 5, 10, 14, 20, 1];
    List<Color> arcColor = [
      Colors.green.withOpacity(.5),
      Colors.black12.withOpacity(.5),
      Colors.pinkAccent.withOpacity(.5),
      Colors.blue.withOpacity(.5),
      Colors.yellow.withOpacity(.5),
      Colors.lightBlueAccent.withOpacity(.5)
    ];
    for (var i = 0; i < arcLengths.length; i++) {
      canvas.drawArc(
          rec,
          3.14 + perviousLength + .025 * i,
          3.14 / arcLengths[i],
          false,
          Paint()
            ..color = arcColor[i]
            ..style = PaintingStyle.stroke
            ..strokeWidth = 10);
      perviousLength += 3.14 / arcLengths[i];
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
