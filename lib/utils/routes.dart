import 'package:babyv_care/screens/bookings.dart';
import 'package:babyv_care/screens/home/homescreen.dart';
import 'package:babyv_care/screens/home/components/mainscreen.dart';
import 'package:babyv_care/screens/messages.dart';
import 'package:babyv_care/screens/notificationscreen.dart';
import 'package:babyv_care/screens/settings/settings.dart';
import 'package:babyv_care/screens/splash-to-home/sign_in_screen.dart';
import 'package:babyv_care/screens/splash-to-home/login_check.dart';
import 'package:babyv_care/screens/splash-to-home/splash/splash_screen.dart';
import 'package:babyv_care/screens/uploadscreen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  LoginCheckScreen.routeName: (context) => const LoginCheckScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  BookingScreen.routeName: (context) => const BookingScreen(),
  MessageScreen.routeName: (context) => MessageScreen(),
  MainScreenForm.routeName: (context) => const MainScreenForm(),
  // AppointmentForm.routeName: (context) => AppointmentForm(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  UploadScreen.routeName: (context) => UploadScreen(),
  // BookingCalendarDemoApp.routeName: (context) => BookingCalendarDemoApp(),
};
