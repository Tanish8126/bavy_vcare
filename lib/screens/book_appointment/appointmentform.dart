import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import 'components/appointmentdata.dart';

class AppointmentForm extends StatelessWidget {
  static String routeName = "/appointmentform";
  String age;
  String vaccine;
  AppointmentForm(this.age, this.vaccine);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Appointment Form"),
              backgroundColor: kbg,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        const Text("Selected Age",
                            style: TextStyle(
                                color: kMainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(age,
                            style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Selected Vaccine",
                            style: TextStyle(
                                color: kMainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(vaccine,
                            style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: AppForm())
              ],
            )));
  }
}
