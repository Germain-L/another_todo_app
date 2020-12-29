
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'pages/splash.dart';
import 'provider/auth.dart';
import 'provider/firestore.dart';
import 'provider/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // User previousUser = await trySignInSilent();

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        // create: (_) => previousUser == null ? AuthProvider() : AuthProvider(user: previousUser),
        create: (_) => AuthProvider()
      ),
      ChangeNotifierProvider(
        create: (_) => FirestoreHelper(),
      ),
    ],
    child: App(),
  ));
}


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    authProvider.trySignInSilent();

    return MaterialApp(
      theme: themeProvider.isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: authProvider.isLoggedIn ? Home() : SplashScreen(),
    );
  }
}
