import 'package:flutter/material.dart';

import '../widgets/buttons/register_dialog.dart';
import '../widgets/buttons/sign_in_dialog.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            Center(
              child: Text("Yet another TODO app"),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.95,
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      signInDialog(context);
                    },
                    child: Text("Sign in"),
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.95,
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      registerDialog(context);
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}