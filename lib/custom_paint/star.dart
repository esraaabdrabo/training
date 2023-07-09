import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 250,
        height: 250,
        child: CustomPaint(
          painter: StarPainter(),
        ));
  }
}

class StarPainter extends CustomPainter {
  const StarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;

    path.moveTo(w * .5, 0);
    path.lineTo(w * .3, h * .4);
    path.lineTo(0, h * .45);
    path.lineTo(w * .25, h * .6);
    path.lineTo(w * .15, h);
    path.lineTo(w * .5, h * .75);
    path.lineTo(w * .8, h);
    path.lineTo(w * .75, h * .6);
    path.lineTo(w, h * .45);
    path.lineTo(w * .7, h * .4);

    canvas.drawPath(path, Paint()..color = Colors.orangeAccent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
