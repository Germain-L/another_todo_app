import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../provider/auth.dart';
import '../../provider/firestore.dart';
import '../../provider/navigation.dart';
import '../../provider/theme.dart';

class SettingsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // THEME
    // LOGOUT
    // DELETE ACCOUNT

    final navigationProvider = Provider.of<Navigation>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final firestore = Provider.of<FirestoreHelper>(context);

    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.8,
                  child: Icon(
                    FontAwesome5.moon,
                  ),
                ),
                Switch(
                  onChanged: (bool value) {
                    themeProvider.setTheme(value);
                  },
                  value: themeProvider.isLightTheme,
                  // activeColor: Colors.white,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Icon(
                    FontAwesome5.sun,
                  ),
                ),
              ],
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.95,
              elevation: 2,
              color: Theme.of(context).buttonColor,
              onPressed: () async {
                await authProvider.signOut();
                Navigator.pop(context);
              },
              child: Text("Sign out"),
            ),
            // MaterialButton(
            //   minWidth: MediaQuery.of(context).size.width * 0.95,
            //   elevation: 2,
            //   color: Theme.of(context).buttonColor,
            //   onPressed: () {
            //     // NEED CONFIRMATION
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return AlertDialog(
            //           title: Text("Confirmation"),
            //           content: Text(
            //               "Deleting your account cannot be undone, we will erase all your data.",
            //               style: TextStyle(fontSize: 13)),
            //           actions: [
            //             FlatButton(
            //               child: Text("Cancel"),
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //             ),
            //             FlatButton(
            //               child: Text(
            //                 "Delete",
            //                 style: TextStyle(
            //                   color: Colors.redAccent,
            //                 ),
            //               ),
            //               onPressed: () {
            //                 String uid = auth.currentUser.uid;
            //                 firestore.deleteUser(uid);
            //                 auth.currentUser.delete();
            //                 Navigator.pop(context);
            //               },
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   },
            //   child: Text("Delete account"),
            // ),
          ],
        ),
      ),
    );
  }
}
