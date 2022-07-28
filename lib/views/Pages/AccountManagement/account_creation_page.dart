import 'package:bill_manager/views/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:bill_manager/views/Pages/AccountManagement/sign_in_page.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({Key? key}) : super(key: key);

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //input field controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Creation',
        ),
      ),
      body: Form(
        key: _formKey,
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
                  hintText: 'Enter your name',
                ),
                controller: nameController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5.0,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter an email address',
                ),
                controller: emailController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5.0,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a password',
                ),
                controller: passwordController,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                User().createUser(
                  nameController.text,
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text(
                'Create Account',
              ),
            ),
            TextButton(
              child: const Text('Already a User? Sign in'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SignInPage();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
