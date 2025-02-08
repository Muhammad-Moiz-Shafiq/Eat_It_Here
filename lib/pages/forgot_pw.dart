import 'package:eat_it_here/components/my_button.dart';
import 'package:eat_it_here/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_services.dart';

class ForgotPw extends StatefulWidget {
  const ForgotPw({super.key});

  @override
  State<ForgotPw> createState() => _ForgotPwState();
}

class _ForgotPwState extends State<ForgotPw> {
  void resetPassword() async {
    if (emailController.text.isNotEmpty) {
      try {
        final _authService = AuthService();
        await _authService.sendPasswordResetEmail(email: emailController.text);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Reset Password'),
                content: Text(
                    'A mail has been sent to your e-mail. Kindly check your mails.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      emailController.clear();
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              );
            });
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            });
      }
    }
  }

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reset Password'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Enter your email and we will send you a reset password link:',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextfield(
              controller: emailController,
              obscureText: false,
              hintText: 'Enter your email address'),
          const SizedBox(
            height: 12,
          ),
          MyButton(
            title: 'Reset Password',
            onTap: resetPassword,
          )
        ],
      ),
    );
  }
}
