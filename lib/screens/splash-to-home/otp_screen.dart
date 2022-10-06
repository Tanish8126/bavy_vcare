import 'package:babyv_care/screens/home/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../utils/constants.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";
  final String phone;
  const OtpScreen(this.phone, {Key? key}) : super(key: key);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
            title: const Text('OTP Verification'),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kbg, Color(0xff82c3df)],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(1.0, 0),
                      tileMode: TileMode.clamp)),
            )),
        body: Column(
          children: [
            Material(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(100)),
                color: const Color.fromARGB(255, 134, 190, 239),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'We have sent your code on\n +91-${widget.phone}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          controller: _pinPutController,
                          pinAnimationType: PinAnimationType.fade,
                          onSubmitted: (pin) async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: _verificationCode!,
                                          smsCode: pin))
                                  .then((value) async {
                                if (value.user != null) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);
                                }
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
