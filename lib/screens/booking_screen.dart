import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/booking/booking_model.dart';
import '../utils/enums.dart';
import '../utils/custtom_bottom_nav_bar.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = '/bookings';
  List<AppointmentBooking> bookingData;
  BookingScreen({Key? key, required this.bookingData}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class AppointmentBooking {
  final String? userId;
  final String? userName;
  final String? doctorId;
  final String? vaccineName;
  final String? email;
  final String? phoneNumber;
  final String? userAddress;
  final int? serviceDuration;
  final DateTime? bookingEnd;

  @JsonKey(
      fromJson: AppUtil.timeStampToDateTime,
      toJson: AppUtil.dateTimeToTimeStamp)
  final DateTime? bookingStart;
  @JsonKey(
      fromJson: AppUtil.timeStampToDateTime,
      toJson: AppUtil.dateTimeToTimeStamp)
  AppointmentBooking({
    this.email,
    this.phoneNumber,
    this.userAddress,
    this.bookingStart,
    this.bookingEnd,
    this.doctorId,
    this.userId,
    this.userName,
    this.vaccineName,
    this.serviceDuration,
  });

  factory AppointmentBooking.fromJson(Map<String, dynamic> json) =>
      AppointmentBooking(
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        userAddress: json['userAddress'] as String?,
        bookingStart:
            AppUtil.timeStampToDateTime(json['bookingStart'] as Timestamp),
        bookingEnd:
            AppUtil.timeStampToDateTime(json['bookingEnd'] as Timestamp),
        doctorId: json['doctorId'] as String?,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        vaccineName: json['vaccineName'] as String?,
        serviceDuration: json['serviceDuration'] as int?,
      );

  get minutes => serviceDuration;

  // Map<String, dynamic> toJson() => {
  //       'email': email,
  //       'phoneNumber': phoneNumber,
  //       'placeAddress': userAddress,
  //       'bookingStart': bookingStart,
  //       'bookingEnd': bookingStart!.add(Duration(minutes: minutes)),
  //       'placeId': doctorId,
  //       'userId': userId,
  //       'userName': userName,
  //       'vaccineName': vaccineName,
  //       'serviceDuration': serviceDuration,
  //     };
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upcoming Bookings",
        ),
      ),
      body: Container(
        child: Column(
          children: [
            // Text(userName),
            // Text("name"),
            // Text("name"),
            // Text("name"),
            // Text("name"),
            // Text("name"),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.bookings),
    );
  }
}
