import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Replace with actual image
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
                  color: Colors.blue,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatItem('Heart rate', '215bpm', Icons.favorite),
                buildStatItem(
                    'Calories', '756cal', Icons.local_fire_department),
                buildStatItem('Weight', '103lbs', Icons.monitor_weight),
              ],
            ),
            SizedBox(height: 30),
            buildMenuItem(Icons.favorite, 'My Saved'),
            buildMenuItem(Icons.calendar_today, 'Appointment'),
            buildMenuItem(Icons.payment, 'Payment Method'),
            buildMenuItem(Icons.help, 'FAQs'),
            buildMenuItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildMenuItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
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
    );
  }
}
