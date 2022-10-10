import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking/booking_model.dart';

// final bookings = FirebaseFirestore.instance.collection('bookings');

CollectionReference bookings =
    FirebaseFirestore.instance.collection('bookings');

CollectionReference<SportBooking> getBookingStream({required String placeId}) {
  return bookings.withConverter<SportBooking>(
    fromFirestore: (snapshots, _) {
      return SportBooking.fromJson(snapshots.data()!);
    },
    toFirestore: (snapshots, _) => snapshots.toJson(),
  );
}

Stream<dynamic>? getBookingStreamFirebase(
    {required DateTime end, required DateTime start}) {
  return bookings
      .withConverter<SportBooking>(
          fromFirestore: (snapshots, _) =>
              SportBooking.fromJson(snapshots.data()!),
          toFirestore: (snapshots, _) => snapshots.toJson())
      .where('bookingStart', isGreaterThanOrEqualTo: start)
      .where('bookingStart',
          isLessThanOrEqualTo: DateTime.now().add(const Duration(days: 50)))
      .snapshots();
}
