import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import 'components/body.dart';

class AppointmentForm extends StatefulWidget {
  static String routeName = "/appointmentform";
  AppointmentForm({Key? key}) : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Body());
  }
}
