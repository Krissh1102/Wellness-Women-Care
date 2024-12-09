import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Vector.png', // Replace with your logo asset
          height: 30,
        ),
        const SizedBox(width: 10),
        Text(
          'WellWomenCare',
          style: GoogleFonts.gochiHand(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}
