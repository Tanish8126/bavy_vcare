import 'package:babyv_care/screens/booking_screen.dart';
import 'package:babyv_care/screens/home/homescreen.dart';
import 'package:babyv_care/screens/home/components/homecreen_form.dart';
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
  SplashScreen.routeName: (context) => const SplashScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  BookingScreen.routeName: (context) => BookingScreen(
        bookingData: [],
      ),
  MessageScreen.routeName: (context) => const MessageScreen(),
  HomeScreenForm.routeName: (context) => const HomeScreenForm(),
  // AppointmentForm.routeName: (context) => AppointmentForm(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  UploadScreen.routeName: (context) => const UploadScreen(),
  // BookingCalendarDemoApp.routeName: (context) => BookingCalendarDemoApp(),
};
