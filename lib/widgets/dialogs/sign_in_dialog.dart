import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../provider/auth.dart';

void signInDialog(BuildContext context) async {
  bool isActivated = false;
  await showDialog<String>(
    context: context,
    child: StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        FocusNode emailNode = FocusNode();
        FocusNode passwordNode = FocusNode();

        final authProvider = Provider.of<AuthProvider>(context);

        bool displayError = false;
        String error;

        TextEditingController emailController = TextEditingController();
        TextEditingController passwordController = TextEditingController();

        signIn() async {
          try {
            setState(() {
              isActivated = true;
            });

            await authProvider.signIn(
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
                focusNode: passwordNode,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                controller: passwordController,
                onSubmitted: (String s) async => signIn(),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: const Text('SIGN IN'),
              onPressed: () async => signIn(),
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
    ),
  );
}
