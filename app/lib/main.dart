import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/themes/themes.dart';
import 'pages/home.dart';
import 'pages/splash.dart';
import 'provider/auth.dart';
import 'provider/firestore.dart';
import 'provider/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // User previousUser = await trySignInSilent();

  // await SystemChrome.setEnabledSystemUIOverlays([]);

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
          // create: (_) => previousUser == null ? AuthProvider() : AuthProvider(user: previousUser),
          create: (_) => AuthProvider()),
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
  bool started = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    if (!started) {
      authProvider.trySignInSilent();
      themeProvider.checkSavedTheme();

      setState(() => started = true);
    }

    return MaterialApp(
      theme: themeProvider.isLightTheme ? lightTheme : darkTheme,
      home: authProvider.isLoggedIn ? Home() : SplashScreen(),
    );
  }
}
