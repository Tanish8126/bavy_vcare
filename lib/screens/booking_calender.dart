// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:booking_calendar/booking_calendar.dart';
// import 'package:intl/date_symbol_data_local.dart';

// import '../utils/size_config.dart';

// class BookingCalendarDemoApp extends StatefulWidget {
//   static String routeName = "/bookingcalender";
//   const BookingCalendarDemoApp({Key? key}) : super(key: key);

//   @override
//   State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
// }

// class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
//   final now = DateTime.now();
//   late BookingService mockBookingService;

//   @override
//   void initState() {
//     super.initState();

//     mockBookingService = BookingService(
//         serviceName: 'Mock Service',
//         serviceDuration: 15,
//         bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
//         bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
//   }

//   Stream<dynamic>? getBookingStreamMock(
//       {required DateTime end, required DateTime start}) {
//     return Stream.value([]);
//   }

//  Future<dynamic> uploadBookingFirebase(
//     {required BookingService newBooking}) async {
//     await bookings
//         .doc('your id, or autogenerate')
//         .collection('bookings')
//         .add(newBooking.toJson())
//         .then((value) => print("Booking Added"))
//         .catchError((error) => print("Failed to add booking: $error"));
//     }
//   }
//   List<DateTimeRange> converted = [];

//   List<DateTimeRange> convertStreamResultFirebase(
//       {required dynamic streamResult}) {
//     DateTime first = now;
//     DateTime second = now.add(const Duration(minutes: 55));
//     DateTime third = now.subtract(const Duration(minutes: 240));
//     DateTime fourth = now.subtract(const Duration(minutes: 500));
//     converted.add(
//         DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
//     converted.add(DateTimeRange(
//         start: second, end: second.add(const Duration(minutes: 23))));
//     converted.add(DateTimeRange(
//         start: third, end: third.add(const Duration(minutes: 15))));
//     converted.add(DateTimeRange(
//         start: fourth, end: fourth.add(const Duration(minutes: 50))));
//     return converted;
//   }

//   List<DateTimeRange> generatePauseSlots() {
//     return [
//       DateTimeRange(
//           start: DateTime(now.year, now.month, now.day, 12, 0),
//           end: DateTime(now.year, now.month, now.day, 13, 0))
//     ];
//   }

//   CollectionReference bookings =
//       FirebaseFirestore.instance.collection('bookings');

//   CollectionReference<VaccineBooking> getBookingStream(
//       {required String placeId}) {
//     return bookings
//         .doc(placeId)
//         .collection('bookings')
//         .withConverter<VaccineBooking>(
//           fromFirestore: (snapshots, _) =>
//               VaccineBooking.fromJson(snapshots.data()!),
//           toFirestore: (snapshots, _) => snapshots.toJson(),
//         );
//   }

//   ///How you actually get the stream of data from Firestore with the help of the previous function
//   ///note that this query filters are for my data structure, you need to adjust it to your solution.
//   Stream<dynamic>? getBookingStreamFirebase(
//       {required DateTime end, required DateTime start}) {
//     return ApiRepository.getBookingStream(placeId: 'YOUR_DOC_ID')
//         .where('bookingStart', isGreaterThanOrEqualTo: start)
//         .where('bookingStart', isLessThanOrEqualTo: end)
//         .snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     initializeDateFormatting('en_US', null);
//     SizeConfig().init(context);
//     return Scaffold(
//       body: SizedBox(
//         height: 1000,
//         width: double.infinity,
//         child: Center(
//           child: BookingCalendar(
//             bookingService: mockBookingService,
//             convertStreamResultToDateTimeRanges: convertStreamResultFirebase,
//             getBookingStream: getBookingStreamFirebase,
//             uploadBooking: uploadBookingFirebase,
//             pauseSlots: generatePauseSlots(),
//             pauseSlotText: 'LUNCH',
//             hideBreakTime: false,
//             loadingWidget: const Text('Fetching data...'),
//             uploadingWidget: const CircularProgressIndicator(),
//             locale: 'en_US',
//             startingDayOfWeek: StartingDayOfWeek.monday,
//           ),
//         ),
//       ),
//     );
//   }
// }
