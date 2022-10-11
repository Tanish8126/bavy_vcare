import 'package:flutter/widgets.dart';

import '../screens/booking_screen.dart';
import '../screens/home/components/homecreen_form.dart';
import '../screens/home/homescreen.dart';
import '../screens/messages.dart';
import '../screens/notificationscreen.dart';
import '../screens/past_booking_screen.dart';
import '../screens/settings/settings.dart';
import '../screens/splash-to-home/login_check.dart';
import '../screens/splash-to-home/mobile_screen.dart';
import '../screens/splash-to-home/splash/splash_screen.dart';
import '../screens/uploadscreen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  LoginCheckScreen.routeName: (context) => const LoginCheckScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  BookingScreen.routeName: (context) => const BookingScreen(),
  PastBookingScreen.routeName: (context) => PastBookingScreen(),
  MessageScreen.routeName: (context) => const MessageScreen(),
  HomeScreenForm.routeName: (context) => const HomeScreenForm(),
  // AppointmentForm.routeName: (context) => AppointmentForm(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  UploadScreen.routeName: (context) => const UploadScreen(),
};
