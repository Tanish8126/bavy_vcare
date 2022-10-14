// ignore_for_file: must_be_immutable

import 'package:babyv_care/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/bookingscreen_controller.dart';
import '../utils/size_config.dart';
import 'booking_screen.dart';

class PastBookingScreen extends StatefulWidget {
  static String routeName = '/pastbookings';

  const PastBookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PastBookingScreen> createState() => _PastBookingScreenState();
}

class _PastBookingScreenState extends State<PastBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Past Bookings",
          ),
        ),
        body: Column(children: [
          SizedBox(height: SizeConfig.screenHeight * 0.008),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, BookingScreen.routeName);
              }),
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                width: getProportionateScreenWidth(250),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: const Text(
                  "See Upcoming Appointments??",
                  style: TextStyle(fontWeight: FontWeight.w600, color: kBlack),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.008),
          const Text(
            'Past Appointments',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryLightColor),
          ),
          const Divider(
            height: 15,
            thickness: 2,
            color: Colors.black45,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: appointmentList2,
              builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // if (snapshot.data!.docs.isEmpty) {
                //   return const Text(
                //     'No Upcoming Appointment',
                //     style: TextStyle(fontSize: 20),
                //   );
                // }
                else {
                  final List bookingdataold = [];
                  snapshot.data?.docs.map((DocumentSnapshot document) {
                    Map bookdataold = document.data() as Map<String, dynamic>;
                    bookingdataold.add(bookdataold);
                    print(bookingdataold);
                  }).toList();
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: bookingdataold.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        return Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(12)),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kTextColor2),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            SizeConfig.screenHeight * 0.015),
                                    buildOption(
                                      context,
                                      'Parent Name: ${document["userName"]}',
                                    ),
                                    buildOption(context,
                                        'Baby Name: ${document["babyName"]}'),
                                    buildOption(context,
                                        'Mobile Number: ${document["phoneNumber"]}'),
                                    buildOption(context,
                                        'Email Id: ${document["email"]}'),
                                    buildOption(context,
                                        'Gender: ${document["babyGender"]}'),
                                    buildOption(context,
                                        'Booking Start: ${DateFormat('dd-MM-yyyy : h:mm a').format(document["bookingStart"].toDate())}'),
                                    buildOption(context,
                                        'Booking End: ${DateFormat('yyyy-MM-dd : h:mm a').format(document["bookingEnd"].toDate())}'),
                                    buildOption(context,
                                        'Doctor Name: ${document["doctorName"]}'),
                                    SizedBox(
                                        height:
                                            SizeConfig.screenHeight * 0.015),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }))
        ]));
  }
}

buildOption(
  BuildContext context,
  String title,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kBlack,
          ),
        ),
      ],
    ),
  );
}
