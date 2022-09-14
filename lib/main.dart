import 'package:babyv_care/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/splash-to-home/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby V Care',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
