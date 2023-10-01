import 'package:flutter/material.dart';

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "title".toUpperCase(),
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ))
            ],
          ),
          SizedBox(
            width: 200,
            child: const Text(
              "abd hihs hyhygsss li9wjbs 556sdsko",
            ),
          )
        ],
      ),
    );
  }
}
