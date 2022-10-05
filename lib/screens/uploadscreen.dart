import 'package:babyv_care/utils/constants.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  static String routeName = '/upload';
  UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Your Documents",
        ),
      ),
    );
  }
}
