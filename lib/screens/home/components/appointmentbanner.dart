// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../utils/size_config.dart';
import '../../../utils/constants.dart';

class AppointmentBanner extends StatelessWidget {
  const AppointmentBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenWidth * 0.3,
      width: double.infinity,
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(10),
          bottom: getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              colors: [kbg, Color(0xff82c3df)],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1.0, 0),
              tileMode: TileMode.clamp)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: "Upcoming Appointment\n",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Appointment on 12/11/2022",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
