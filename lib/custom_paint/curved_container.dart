import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedContainerClipper(),
      child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.yellow, Colors.blue])),
      ),
    );
  }
}

class CurvedContainerClipper extends CustomClipper<Path> {
  const CurvedContainerClipper();

  @override
  Path getClip(Size size) {
    var path = Path()
      ..moveTo(0, size.height * .3)
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(0, size.height, 50, size.height)
      ..lineTo(size.width - 50, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - 50)
      ..lineTo(size.width, 100)
      ..quadraticBezierTo(size.width, 50, size.width - 50, 52)
      ..lineTo(size.width - 100, 60)
      ..quadraticBezierTo(0, size.height * .2, 0, size.height * .4);

    //   path.moveTo(0, size.height * 0.33);
    //   path.lineTo(0, size.height - roundnessFactor);
    //   path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    //   path.lineTo(size.width - roundnessFactor, size.height);
    //   path.quadraticBezierTo(
    //       size.width, size.height, size.width, size.height - roundnessFactor);
    //   path.lineTo(size.width, roundnessFactor * 2);
    //   path.quadraticBezierTo(size.width - 10, roundnessFactor,
    //       size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
    //   path.lineTo(
    //       roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    //   path.quadraticBezierTo(
    //       0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);
//
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
