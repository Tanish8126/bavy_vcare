import 'package:babyv_care/screens/book_appointment/appointmentform.dart';
import 'package:babyv_care/screens/booking_calender.dart';
import 'package:babyv_care/screens/home/homescreen.dart';
import 'package:babyv_care/screens/home/components/mainscreen.dart';
import 'package:babyv_care/screens/notificationscreen.dart';
import 'package:babyv_care/screens/settings.dart';
import 'package:babyv_care/screens/splash-to-home/sign_in_screen.dart';
import 'package:babyv_care/screens/splash-to-home/splash/splash_screen.dart';
import 'package:babyv_care/screens/uploadscreen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  AppointmentForm.routeName: (context) => AppointmentForm(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  UploadScreen.routeName: (context) => UploadScreen(),
  BookingCalendarDemoApp.routeName: (context) => BookingCalendarDemoApp(),
};
