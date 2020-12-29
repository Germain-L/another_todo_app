import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Another Todo",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Image.asset(
              "assets/app_logo.png",
              height: 200,
            ),
          ],
        ),
      ],
    ));
  }
}
