import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/enums.dart';
import '../utils/custtom_bottom_nav_bar.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = '/bookings';
  BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upcoming Bookings",
        ),
        backgroundColor: kMainColor2,
      ),
      body: Container(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.bookings),
    );
  }
}
