// ignore_for_file: must_be_immutable

import 'package:babyv_care/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/size_config.dart';

class PastBookingScreen extends StatefulWidget {
  static String routeName = '/pastbookings';

  PastBookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PastBookingScreen> createState() => _PastBookingScreenState();
}

class _PastBookingScreenState extends State<PastBookingScreen> {
  final Stream<QuerySnapshot> appointmentList = FirebaseFirestore.instance
      .collection('bookings')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      //  .where("time", isLessThan: DateTime.now().millisecondsSinceEpoch)
      .snapshots();

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

          final List bookingdataold = [];
          snapshot.data?.docs.map((DocumentSnapshot document) {
            Map bookdataold = document.data() as Map<String, dynamic>;
            bookingdataold.add(bookdataold);
            print(bookingdataold);
          }).toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Past Bookings",
              ),
            ),
            body: Column(
              children: [
                const Text(
                  'Past Booking',
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
                Flexible(
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
                                      height: SizeConfig.screenHeight * 0.015),
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
                                      height: SizeConfig.screenHeight * 0.015),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
              ],
            ),
          );
        }));
  }

  buildOption(
    BuildContext context,
    String title,
  ) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
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
}
