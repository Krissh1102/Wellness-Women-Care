import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wellnes/src/res/colors.dart';
import 'package:wellnes/src/utils/app_icon.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight, // Light blue background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppIcon(),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                    'assets/profile.jpg'), // Replace with actual image
              ),
              SizedBox(height: 10),
              Text(
                'Emily Davidson',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Edit profile logic here
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStatItem('Heart rate', '215bpm', Icons.favorite, () {}),
                  Container(
                    height: 70,
                    width: 1,
                    color: Colors.grey[400],
                  ),
                  buildStatItem(
                      'Calories', '756cal', Icons.local_fire_department, () {
                    // Calories logic here
                  }),
                  Container(
                    height: 70,
                    width: 1,
                    color: Colors.grey[400],
                  ),
                  buildStatItem('Weight', '103lbs', Icons.monitor_weight, () {
                    // Weight logic here
                  }),
                ],
              ),
              SizedBox(height: 30),
              buildMenuItem(Icons.favorite_border_outlined, 'My Saved', () {
                // My Saved logic here
              }),
              buildMenuItem(Icons.calendar_today_outlined, 'Appointment', () {
                context.go('/allappointment');
              }),
              buildMenuItem(Icons.payment_outlined, 'Payment Method', () {
                // Payment Method logic here
              }),
              buildMenuItem(Icons.help_center_outlined, 'FAQs', () {
                // FAQs logic here
              }),
              buildMenuItem(Icons.logout_outlined, 'Logout', () {
                // Logout logic here
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatItem(
      String label, String value, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.blue[800],
            size: 35,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 72, 208, 253),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            const Divider(
              color: Color.fromRGBO(179, 229, 252, 1),
            ),
          ],
        ),
      ),
    );
  }
}
