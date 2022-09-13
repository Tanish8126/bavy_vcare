import 'package:babyv_care/screens/appointmentform.dart';
import 'package:babyv_care/screens/home_screen.dart';
import 'package:babyv_care/screens/mainscreen.dart';
import 'package:babyv_care/screens/settings.dart';
import 'package:babyv_care/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import '../screens/sign_in/sign_in_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  AppointmentForm.routeName: (context) => AppointmentForm(),
};
