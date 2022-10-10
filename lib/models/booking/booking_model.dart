import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

List<DateTimeRange> convertStreamResultFirebase(
    {required dynamic streamResult}) {
  List<DateTimeRange> converted = [];

  for (var i = 0; i < streamResult.size; i++) {
    final item = streamResult.docs[i].data();
    converted.add(
        DateTimeRange(start: (item.bookingStart!), end: (item.bookingEnd!)));
  }
  return converted;
}

@JsonSerializable(explicitToJson: true)
class SportBooking {
  final String? userId;
  final String? userName;
  final String? doctorName;
  final String? babyName;
  final String? babyGender;
  final String? relationship;
  final String? vaccineName;
  final int? serviceDuration;

  @JsonKey(
      fromJson: AppUtil.timeStampToDateTime,
      toJson: AppUtil.dateTimeToTimeStamp)
  final DateTime? bookingStart;
  @JsonKey(
      fromJson: AppUtil.timeStampToDateTime,
      toJson: AppUtil.dateTimeToTimeStamp)
  final DateTime? bookingEnd;
  final String? email;
  final String? phoneNumber;
  final String? userAddress;

  SportBooking({
    this.email,
    this.phoneNumber,
    this.userAddress,
    this.bookingStart,
    this.bookingEnd,
    this.doctorName,
    this.babyName,
    this.babyGender,
    this.relationship,
    this.userId,
    this.userName,
    this.vaccineName,
    this.serviceDuration,
  });

  factory SportBooking.fromJson(Map<String, dynamic> json) => SportBooking(
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        userAddress: json['placeAddress'] as String?,
        bookingStart:
            AppUtil.timeStampToDateTime(json['bookingStart'] as Timestamp),
        bookingEnd:
            AppUtil.timeStampToDateTime(json['bookingEnd'] as Timestamp),
        doctorName: json['doctorName'] as String?,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        vaccineName: json['vaccineName'] as String?,
        babyName: json['babyName'] as String?,
        babyGender: json['babyGender'] as String?,
        relationship: json['relationship'] as String?,
        serviceDuration: json['serviceDuration'] as int?,
      );

  get minutes => serviceDuration;

  Map<String, dynamic> toJson() => {
        'email': email,
        'phoneNumber': phoneNumber,
        'userAddress': userAddress,
        'bookingStart': bookingStart,
        'bookingEnd': bookingStart!.add(Duration(minutes: minutes)),
        'doctorName': doctorName,
        'babyName': babyName,
        'babyGender': babyGender,
        'relationship': relationship,
        'userId': userId,
        'userName': userName,
        'vaccineName': vaccineName,
        'serviceDuration': serviceDuration,
      };
}

class AppUtil {
  static DateTime timeStampToDateTime(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }

  static Timestamp dateTimeToTimeStamp(DateTime? dateTime) {
    return Timestamp.fromDate(dateTime ?? DateTime.now()); //To TimeStamp
  }
}
