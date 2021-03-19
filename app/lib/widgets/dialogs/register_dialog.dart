import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../provider/auth.dart';

void registerDialog(BuildContext context) async {
  bool isActivated = false;
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          FocusNode emailNode = FocusNode();
          FocusNode passwordNode = FocusNode();
          FocusNode confirmationNode = FocusNode();

          final authProvider = Provider.of<AuthProvider>(context);

          bool displayError = false;
          String error;

          TextEditingController emailController = TextEditingController();
          TextEditingController passwordController = TextEditingController();
          TextEditingController confirmationController =
              TextEditingController();

          register() async {
            if (passwordController.text == confirmationController.text) {
              try {
                setState(() {
                  isActivated = true;
                });

                await authProvider.registerEmailPassword(
                  emailController.text,
                  passwordController.text,
                );

                Navigator.pop(context);
              } catch (e) {
                setState(() {
                  displayError = true;
                  error = e.message;
                  isActivated = false;
                });
              }
            } else {
              setState(() {
                displayError = true;
                error = "Passwords must match";
                isActivated = false;
              });
            }
          }

          return AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (displayError) Text(error),
                TextField(
                  autofocus: true,
                  focusNode: emailNode,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'todo@gmail.com',
                  ),
                  controller: emailController,
                  onSubmitted: (String s) {
                    FocusScope.of(context).requestFocus(passwordNode);
                  },
                ),
                TextField(
                  obscureText: true,
                  focusNode: passwordNode,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  controller: passwordController,
                  onSubmitted: (String s) {
                    FocusScope.of(context).requestFocus(confirmationNode);
                  },
                ),
                TextField(
                  focusNode: confirmationNode,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  controller: confirmationController,
                  onSubmitted: (String s) async => register(),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Register'),
                onPressed: () async => register(),
              ),
              isActivated
                  ? Transform.scale(
                      scale: 0.5,
                      child: SpinKitWave(
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    )
                  : null,
            ],
          );
        },
      );
    },
  );
}
