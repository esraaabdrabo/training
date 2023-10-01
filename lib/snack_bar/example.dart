import 'package:flutter/material.dart';
import 'package:training/snack_bar/positioned_icon.dart';
import 'package:training/snack_bar/snack_bar.dart';

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Center(
                  child: SizedBox(
                      height: 140,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [SnackBarContent(), SnackBarPositionedIcon()],
                      )),
                ))),
        child: Text("press"));
  }
}
