import 'package:babyv_care/screens/home/components/mainscreen.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import 'banner.dart';
import '../../notificationscreen.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Baby V Care",
            ),
            backgroundColor: kMainColor2,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NotificationScreen.routeName);
                  },
                  child: Icon(
                    Icons.notifications_active_sharp,
                    color: kPrimaryLightColor,
                    size: 40,
                  ),
                ),
              ),
            ]),
        body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(children: [
              DiscountBanner(),
              Text(
                "Select The Required Vaccine",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Expanded(child: MainScreen())
            ])));
  }
}
