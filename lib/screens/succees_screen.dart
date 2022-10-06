import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  final mobile = FirebaseAuth.instance.currentUser!.phoneNumber;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Map<String, dynamic> details = {
    'time': FieldValue.serverTimestamp(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Confirmed")),
      body: Column(
        children: [
          Text('Mobile Number: $mobile'),
          Text(details.toString()),
          Text('User ID: $userId')
        ],
      ),
    );
  }
}
