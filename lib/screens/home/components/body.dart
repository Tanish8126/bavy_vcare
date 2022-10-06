import 'package:babyv_care/screens/home/components/appointmentbanner.dart';
import 'package:babyv_care/screens/home/components/mainscreen.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import 'banner.dart';
import '../../notificationscreen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Baby V Care",
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kbg, Color(0xff82c3df)],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(1.0, 0),
                      tileMode: TileMode.clamp)),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NotificationScreen.routeName);
                  },
                  child: const Icon(
                    Icons.notifications_active_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ]),
        body: Column(children: [
          const DiscountBanner(),
          const AppointmentBanner(),
          const Text(
            "Select The Required Vaccine",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Expanded(child: MainScreenForm())
        ]));
  }
}
