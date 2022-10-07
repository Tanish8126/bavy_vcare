import 'package:auth/auth.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class BookingPage extends StatefulWidget {
  String name;
  String mobile;
  String vaccine;

  BookingPage(this.name, this.mobile, this.vaccine, {Key? key})
      : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final int _currentHours = 1;
  int totalAmount = 100;
  final now = DateTime.now();
  late BookingService myBookingService;

  //final String uid = Auth().currentUser()!.uid;

  // final bookings = FirebaseFirestore.instance.collection('bookings');

  CollectionReference bookings =
      FirebaseFirestore.instance.collection('bookings');

  CollectionReference<SportBooking> getBookingStream(
      {required String placeId}) {
    return bookings
        .doc(placeId)
        .collection('bookings')
        .withConverter<SportBooking>(
          fromFirestore: (snapshots, _) =>
              SportBooking.fromJson(snapshots.data()!),
          toFirestore: (snapshots, _) => snapshots.toJson(),
        );
  }

  ///How you actually get the stream of data from Firestore with the help of the previous function
  ///note that this query filters are for my data structure, you need to adjust it to your solution.
  Stream<dynamic>? getBookingStreamFirebase(
      {required DateTime end, required DateTime start}) {
    return bookings
        .doc('placeId')
        .collection('bookings')
        .withConverter<SportBooking>(
            fromFirestore: (snapshots, _) =>
                SportBooking.fromJson(snapshots.data()!),
            toFirestore: (snapshots, _) => snapshots.toJson())
        .where('bookingStart', isGreaterThanOrEqualTo: start)
        .where('bookingStart',
            isLessThanOrEqualTo: DateTime.now().add(const Duration(days: 50)))
        .snapshots();
  }

  ///After you fetched the data from firestore, we only need to have a list of datetimes from the bookings:
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

  @override
  void initState() {
    super.initState();
    initializeDateFormatting;
    //limit slots
    myBookingService = BookingService(
        serviceName: 'widget.facilityname',
        serviceDuration: 15,
        bookingEnd: DateTime(now.year, now.month, now.day, 24, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    final uploadedBooking = SportBooking(
      email: 'email',
      phoneNumber: widget.mobile,
      placeAddress: 'placeAddress',
      bookingStart: newBooking.bookingStart,
      placeId: 'placeId',
      userId: 'userId',
      userName: widget.name,
      vaccineName: widget.vaccine,
      serviceDuration: _currentHours * 15,
      servicePrice: 500,
    );
    print(widget.mobile);
    print(widget.vaccine);
    print(widget.name);

    await Future.delayed(const Duration(seconds: 5));
    await bookings
        .doc('placeId')
        .collection('bookings')
        .add(uploadedBooking.toJson())
        .catchError((error) => print("failed booking: $error"));
    print('${uploadedBooking.toJson()} has been uploaded');
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
          disabledDays: const [6, 7],
        ),
      ),
    );
  }
}

class AppUtil {
  static DateTime timeStampToDateTime(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }

  static Timestamp dateTimeToTimeStamp(DateTime? dateTime) {
    return Timestamp.fromDate(dateTime ?? DateTime.now()); //To TimeStamp
  }
}

@JsonSerializable(explicitToJson: true)
class SportBooking {
  /// The generated code assumes these values exist in JSON.
  final String? userId;
  final String? userName;
  final String? placeId;
  final String? vaccineName;
  final int? serviceDuration;
  final int? servicePrice;

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
  final String? placeAddress;

  SportBooking(
      {this.email,
      this.phoneNumber,
      this.placeAddress,
      this.bookingStart,
      this.bookingEnd,
      this.placeId,
      this.userId,
      this.userName,
      this.vaccineName,
      this.serviceDuration,
      this.servicePrice});

  /// Connect the generated [_$SportBookingFromJson] function to the `fromJson`
  /// factory.
  factory SportBooking.fromJson(Map<String, dynamic> json) => SportBooking(
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        placeAddress: json['placeAddress'] as String?,
        bookingStart:
            AppUtil.timeStampToDateTime(json['bookingStart'] as Timestamp),
        bookingEnd:
            AppUtil.timeStampToDateTime(json['bookingEnd'] as Timestamp),
        placeId: json['placeId'] as String?,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        vaccineName: json['vaccineName'] as String?,
        serviceDuration: json['serviceDuration'] as int?,
        servicePrice: json['servicePrice'] as int?,
      );

  get minutes => serviceDuration;

  /// Connect the generated [_$SportBookingToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => {
        'email': email,
        'phoneNumber': phoneNumber,
        'placeAddress': placeAddress,
        'bookingStart': bookingStart,
        'bookingEnd': bookingStart!.add(Duration(minutes: minutes)),
        'placeId': placeId,
        'userId': userId,
        'userName': userName,
        'vaccineName': vaccineName,
        'serviceDuration': serviceDuration,
        'servicePrice': servicePrice,
      };
}
