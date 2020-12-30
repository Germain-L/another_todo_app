import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';
import '../widgets/buttons/custom_material_button.dart';
import '../widgets/views/splash_logo.dart';

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
                  CustomMaterialButton(
                    onPressed: authProvider.signInWithGoogle,
                    text: "Sign in with Google",
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
