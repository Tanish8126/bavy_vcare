import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'appointmentdata.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Booking"),
        backgroundColor: kMainColor2,
      ),
      body: AppForm(),
    );
  }
}
