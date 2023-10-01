import 'package:flutter/material.dart';

class SnackBarPositionedIcon extends StatelessWidget {
  const SnackBarPositionedIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(500)),
            elevation: 0, // 5,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromARGB(255, 202, 42, 30),
                  child: Icon(Icons.android_rounded)),
            ),
          ),
        ],
      ),
    );
  }
}
