import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:bill_manager/views/Models/User.dart';

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

  //input controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      body: Form(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(
              5.0,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
              controller: emailController,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              controller: passwordController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              User().loginUser(
                emailController.text,
                passwordController.text,
                deviceName.toString(),
              );
            },
            child: const Text(
              'Sign In',
            ),
          ),
        ],
      )),
    );
  }
}
