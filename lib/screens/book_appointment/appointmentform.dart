// ignore_for_file: must_be_immutable, prefer_if_null_operators, unnecessary_null_comparison

import 'package:babyv_care/screens/book_appointment/components/body.dart';
import 'package:flutter/material.dart';

import '../../models/appointmentscreen_controller.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class AppointmentForm extends StatefulWidget {
  static String routeName = "/appointmentform";
  String babyage;
  String selectedvaccine;
  AppointmentForm(this.babyage, this.selectedvaccine, {Key? key})
      : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  String genderValue = genders.first;
  String relationValue = relations.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Appointment Form"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [kbg, Color(0xff82c3df)],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(1.0, 0),
                    tileMode: TileMode.clamp)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kTextColor2),
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.015),
                      const Text("Selected Age",
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(widget.babyage,
                          style: const TextStyle(
                              color: kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                      SizedBox(height: SizeConfig.screenHeight * 0.010),
                      const Text("Selected Vaccine",
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(widget.selectedvaccine,
                          style: const TextStyle(
                              color: kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                      SizedBox(height: SizeConfig.screenHeight * 0.015),
                    ],
                  ),
                ),
                const Body()
              ])),
        ),
      ),
    );
  }
}
