import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text("We sent your code to +91 898 860 ***",
                  style: TextStyle(color: Colors.black45)),
              //buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),

              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black),
                ),
              ),
              OtpForm(),
              //SizedBox(height: SizeConfig.screenHeight * 0.1),
            ],
          ),
        ),
      ),
    ));
  }

  // Row buildTimer() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text("This code will expired in ",
  //           style: TextStyle(color: kPrimaryLightColor)),
  //       TweenAnimationBuilder(
  //         tween: Tween(begin: 30.0, end: 0.0),
  //         duration: Duration(seconds: 30),
  //         builder: (_, dynamic value, child) => Text(
  //           "00:${value.toInt()}",
  //           style: TextStyle(color: kPrimaryColor),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
