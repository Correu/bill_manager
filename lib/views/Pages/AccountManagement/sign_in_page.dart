import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ///Gathering device info
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late AndroidDeviceInfo androidDeviceInfo;

  String? deviceName;

  void getDeviceData() async {
    androidDeviceInfo = await deviceInfoPlugin.androidInfo;

    setState(() {
      deviceName = androidDeviceInfo.device;
    });
  }

  @override
  void initState() {
    super.initState();
    getDeviceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign in Page',
        ),
      ),
      body: Text(
        '$deviceName',
      ),
    );
  }
}
