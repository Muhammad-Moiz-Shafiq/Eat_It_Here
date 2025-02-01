import 'package:eat_it_here/components/my_button.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_box,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            const Text('Let\'s make an account!',
                style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            MyTextfield(
              controller: emailController,
              obscureText: false,
              hintText: 'Email',
            ),
            //const SizedBox(height: 20),
            MyTextfield(
              controller: passwordController,
              obscureText: true,
              hintText: 'Password',
            ),
            MyTextfield(
              controller: confirmPasswordController,
              obscureText: true,
              hintText: 'Confirm Password',
            ),
            const SizedBox(height: 10),
            MyButton(
              onTap: () {},
              title: 'Register',
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
