// ignore_for_file: unnecessary_const, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../utils/dafault_button2.dart';
import '../../../../utils/size_config.dart';
import '../../login_check.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              top: getProportionateScreenWidth(50),
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10)),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/babyvcare.png',
                width: 200,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              const Text(
                "Welcome to India's First Baby Vaccination app!",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
              DefaultButton2(
                text: "Discover more ..",
                press: () {
                  Navigator.pushNamed(context, LoginCheckScreen.routeName);
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
