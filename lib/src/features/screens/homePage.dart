import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

import 'package:wellnes/src/features/screens/home/homeScreen.dart';
import 'package:wellnes/src/features/screens/home/notificationScreen.dart';
import 'package:wellnes/src/features/screens/home/profileScreen.dart';
import 'package:wellnes/src/features/screens/home/reportScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ReportsScreen(),
    NotificationsScreen(),
    ProfileScreen()
  ];

  final List<String> _unselectedIcons = [
    'assets/svgs/Home.svg',
    'assets/svgs/Frame 5.svg',
    'assets/svgs/7503212_notification_bell_alert_icon 2.svg',
    'assets/svgs/Profile1.svg',
  ];

  final List<String> _selectedIcons = [
    'assets/svgs/Home1.svg',
    'assets/svgs/Frame 5 (1).svg',
    'assets/svgs/7503212_notification_bell_alert_icon 1.svg',
    'assets/svgs/Profile.svg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _unselectedIcons.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _unselectedIcons[index],
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              _selectedIcons[index],
              width: 24,
              height: 24,
            ),
            label: ['Home', 'Reports', 'Notification', 'Profile'][index],
          ),
        ),
      ),
    );
  }
}
