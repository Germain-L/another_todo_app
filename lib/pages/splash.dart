import 'package:another_todo_app/provider/auth.dart';
import 'package:another_todo_app/widgets/views/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/dialogs/register_dialog.dart';
import '../widgets/dialogs/sign_in_dialog.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            SplashLogo(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    highlightElevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minWidth: MediaQuery.of(context).size.width * 0.95,
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      authProvider.signInWithGoogle();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Sign in with Google"),
                    ),
                  ),
                  // MaterialButton(
                  //   minWidth: MediaQuery.of(context).size.width * 0.95,
                  //   color: Theme.of(context).buttonColor,
                  //   onPressed: () {
                  //     signInDialog(context);
                  //   },
                  //   child: Text("Sign in with email"),
                  // ),
                  // MaterialButton(
                  //   minWidth: MediaQuery.of(context).size.width * 0.95,
                  //   color: Theme.of(context).buttonColor,
                  //   onPressed: () {
                  //     registerDialog(context);
                  //   },
                  //   child: Text("Register"),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
