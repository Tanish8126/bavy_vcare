// import 'package:booking_calendar/booking_calendar.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';

// import '../controllers/booking_controller.dart';
// import '../models/booking/vaccine_booking_model.dart';
// import '../utils/size_config.dart';

// class BookingCalendarDemoApp extends StatefulWidget {
//   const BookingCalendarDemoApp({Key? key}) : super(key: key);

//   @override
//   State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
// }

// class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
//   final now = DateTime.now();
//   int _currentHours = 1;
//   late BookingService mockBookingService;

//   @override
//   void initState() {
//     super.initState();
//     // DateTime.now().startOfDay
//     // DateTime.now().endOfDay
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

//   Future<dynamic> uploadBooking({required SportBooking newBooking}) async {
//     final uploadedBooking = SportBooking(
//       email: 'email',
//       phoneNumber: 'phoneNumber',
//       placeAddress: 'placeAddress',
//       bookingStart: newBooking.bookingStart,
//       placeId: widget.facilityname,
//       userId: uid,
//       userName: 'userName',
//       serviceName: widget.facilityname,
//       serviceDuration: _currentHours * 60,
//     );
//     await Future.delayed(const Duration(seconds: 1));
//     await bookings
//         .doc('your id, or autogenerate')
//         .collection('bookings')
//         .add(newBooking.toJson())
//         .then((value) => print("Booking Added"))
//         .catchError((error) => print("Failed to add booking: $error"));
//   }

//   List<DateTimeRange> converted = [];

//   List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
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

//   @override
//   Widget build(BuildContext context) {
//     initializeDateFormatting('en_US', null);
//     SizeConfig().init(context);
//     return Scaffold(
//         body: SizedBox(
//       height: 1000,
//       width: double.infinity,
//       child: Center(
//         child: BookingCalendar(
//           bookingService: mockBookingService,
//           convertStreamResultToDateTimeRanges: convertStreamResultFirebase,
//           getBookingStream: getBookingStreamFirebase,
//           uploadBooking: uploadBooking,
//           pauseSlots: generatePauseSlots(),
//           pauseSlotText: 'LUNCH',
//           hideBreakTime: false,
//           loadingWidget: const Text('Fetching data...'),
//           uploadingWidget: const CircularProgressIndicator(),
//           locale: 'en_US',
//           startingDayOfWeek: StartingDayOfWeek.tuesday,
//           disabledDays: const [6, 7],
//         ),
//       ),
//     ));
//   }
// }
