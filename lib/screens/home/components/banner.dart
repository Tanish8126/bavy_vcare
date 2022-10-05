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
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(10)),
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
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: "Get Vaccinated Now",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(22),
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
