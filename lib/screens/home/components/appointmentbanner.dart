// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/size_config.dart';
import '../../../utils/constants.dart';

class AppointmentBanner extends StatelessWidget {
  final Stream<QuerySnapshot> appointmentList = FirebaseFirestore.instance
      .collection('bookings')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  AppointmentBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: appointmentList,
      builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final List bookingdata1 = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map bookdata1 = document.data() as Map<String, dynamic>;
          bookingdata1.add(bookdata1);
        }).toList();

        return Container(
            height: SizeConfig.screenWidth * 0.3,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(10),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    colors: [kbg, Color(0xff82c3df)],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(1.0, 0),
                    tileMode: TileMode.clamp)),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: Column(
                children: [
                  Text(
                    "Upcoming Appointment",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.bold,
                        color: kWhite),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: bookingdata1.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        return Text(
                          'Booking On: ${DateFormat('dd-MM-yyyy - h:mm a').format(document["bookingStart"].toDate())}',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(30),
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        );
                      }),
                ],
              ),
            ));
      }),
    );
  }
}
