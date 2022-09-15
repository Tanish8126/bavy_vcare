import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import 'components/appointmentdata.dart';

class AppointmentForm extends StatelessWidget {
  static String routeName = "/appointmentform";
  const AppointmentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Appointment Booking"),
        backgroundColor: kMainColor2,
      ),
      body: AppForm(),
    ));
  }
}
