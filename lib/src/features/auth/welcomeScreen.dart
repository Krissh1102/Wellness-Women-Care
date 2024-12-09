import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/utils/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // Light blue background
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            // Logo
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Vector.png',
                    height: 114,
                  ),

                  const SizedBox(height: 20),
                  // Title
                  Image.asset(
                    'assets/images/logo.png',
                    height: 51,
                  ),
                ],
              ),
            ),

            // Get Started Button
            Align(
                alignment: Alignment.bottomCenter,
                child: GradientButton(
                    text: 'Get Started',
                    onPressed: () {
                      context.go('/login');
                    })),
          ],
        ),
      ),
    );
  }
}
