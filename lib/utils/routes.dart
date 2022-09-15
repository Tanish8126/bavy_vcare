import 'package:babyv_care/screens/book_appointment/appointmentform.dart';
import 'package:babyv_care/screens/booking_calender.dart';
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
import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  LoginCheckScreen.routeName: (context) => HomeScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  BookingScreen.routeName: (context) => BookingScreen(),
  MessageScreen.routeName: (context) => MessageScreen(),
  MainScreenForm.routeName: (context) => MainScreenForm(),
  AppointmentForm.routeName: (context) => AppointmentForm(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  UploadScreen.routeName: (context) => UploadScreen(),
  BookingCalendarDemoApp.routeName: (context) => BookingCalendarDemoApp(),
};
