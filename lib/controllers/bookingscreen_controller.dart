import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var datex = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
var datex2 = DateTime(DateTime.now().year, DateTime.now().month - 1, 0);

final Stream<QuerySnapshot> appointmentList = FirebaseFirestore.instance
    .collection('bookings')
    .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .where("bookingStart", isLessThanOrEqualTo: datex)
    .where("bookingStart", isGreaterThan: DateTime.now())
    .snapshots();

final Stream<QuerySnapshot> appointmentList2 = FirebaseFirestore.instance
    .collection('bookings')
    .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .where("bookingStart", isGreaterThanOrEqualTo: datex2)
    .where("bookingStart", isLessThan: DateTime.now())
    .snapshots();
