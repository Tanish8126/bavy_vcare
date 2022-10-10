// ignore_for_file: must_be_immutable

import 'package:auth/auth.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';

import '../controllers/booking_controller.dart';
import '../models/booking/booking_model.dart';

class BookingPage extends StatefulWidget {
  String name;
  String mobile;
  String address;
  String babyName;
  String relationship;
  String doctorName;
  String babyGender;
  String email;

  BookingPage(this.name, this.mobile, this.address, this.babyGender,
      this.babyName, this.doctorName, this.relationship, this.email,
      {Key? key})
      : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final int _currentHours = 1;
  final now = DateTime.now();
  late BookingService myBookingService;

  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    final uploadedBooking = SportBooking(
      email: widget.email,
      phoneNumber: widget.mobile,
      userAddress: widget.address,
      bookingStart: newBooking.bookingStart,
      userId: uid,
      doctorName: widget.doctorName,
      babyName: widget.babyName,
      babyGender: widget.babyGender,
      relationship: widget.relationship,
      userName: widget.name,
      vaccineName: "vaccine",
      serviceDuration: _currentHours * 15,
    );

    await Future.delayed(const Duration(seconds: 2));
    await bookings.add(uploadedBooking.toJson());
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting;
    uid;

    myBookingService = BookingService(
        serviceName: 'widget.facilityname',
        serviceDuration: 15,
        bookingEnd: DateTime(now.year, now.month, now.day, 24, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Widget _bookingexplaination() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              icon: Icon(
                Icons.circle,
                color: Colors.green[200],
              ),
              label: const Text('Available',
                  style: TextStyle(color: Colors.black)),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.circle,
                color: Colors.red,
              ),
              label:
                  const Text('Booked', style: TextStyle(color: Colors.black)),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookingCalendar(
          bookingService: myBookingService,
          getBookingStream: getBookingStreamFirebase,
          uploadBooking: uploadBookingMock,
          convertStreamResultToDateTimeRanges: convertStreamResultFirebase,
          bookingExplanation: _bookingexplaination(),
          //pauseSlots: generatePauseSlots(),
          pauseSlotText: 'LUNCH',
          hideBreakTime: false,
          loadingWidget: const Text('Fetching data...'),
          locale: 'en_US',

          startingDayOfWeek: StartingDayOfWeek.monday,
          disabledDays: const [7],
        ),
      ),
    );
  }
}
