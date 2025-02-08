import 'package:eat_it_here/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'homePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Center(
              child: Lottie.asset('assets/animation/Animation.json'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthGate()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Let's Eat",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        //fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
