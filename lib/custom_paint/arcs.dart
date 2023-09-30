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
          painter: CustomArcPainter(),
        ),
      ),
    );
  }
}

class CustomArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
        center: Offset(size.width * .5, size.height * .5),
        width: size.width * .8,
        height: size.height * .8);
    List<int> arcLengthList = [5, 4, 6, 5, 8];
    List<Color> arcColorList = [
      const Color.fromRGBO(244, 67, 54, 1),
      Colors.yellow,
      Colors.blue,
      Colors.black,
      Colors.lime,
    ];

    canvas.drawRect(
        rect,
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
    double previousLength = 0;
    for (var i = 0; i < arcLengthList.length; i++) {
      canvas.drawArc(
          rect,
          3.14 + previousLength + .08 * i, // start point + white space
          3.14 / arcLengthList[i] // length of the arc
          ,
          false,
          Paint()
            ..style = PaintingStyle.stroke
            ..color = arcColorList[i]
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 10);

      previousLength += 3.14 / arcLengthList[i];
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
