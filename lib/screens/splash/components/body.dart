import 'package:babyv_care/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/dafault_button.dart';
import '../../../utils/size_config.dart';
import '../../otp/otp_screen.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to India's First Baby Vaccination app!",
      "image": "assets/images/logo.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              // Text(
              //   "Baby V Care",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 26),
              //   textAlign: TextAlign.center,
              // ),
              Image.asset(
                'assets/images/babyvcare2.png',
                width: 200,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to India's First Baby Vaccination app!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),

              Spacer(flex: 3),
              DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
