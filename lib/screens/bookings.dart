import 'package:flutter/material.dart';

import '../utils/enums.dart';
import 'custtom_bottom_nav_bar.dart';

class Bookings extends StatefulWidget {
  Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.bookings),
    );
  }
}
