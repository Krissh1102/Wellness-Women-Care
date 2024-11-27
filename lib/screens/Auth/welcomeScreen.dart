import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // Light blue background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Logo
          Center(
            child: Image.asset(
              'assets/logo.png', // Replace with your logo asset
              height: 150,
            ),
          ),
          SizedBox(height: 20),
          // Title
          Text(
            'WellWomenCare',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10),
          // Tagline
          Text(
            '“Empowering Her Nature, Nurturing Her Health.”',
            style: TextStyle(
              fontSize: 16,
              color: Colors.indigo[300],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          // Get Started Button
          ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
