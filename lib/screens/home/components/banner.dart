// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
        vertical: getProportionateScreenWidth(10),
      ),
      decoration: BoxDecoration(
        color: kMainColor2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: "Welcome to Baby V Care\n",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Get Vaccinated Now",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
