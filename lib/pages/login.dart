import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            MyTextfield(
              controller: TextEditingController(),
              obscureText: false,
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            MyTextfield(
              controller: TextEditingController(),
              obscureText: true,
              hintText: 'Password',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
