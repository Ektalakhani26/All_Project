
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Profile_Page.dart';


class BottomBar {
  static BottomNavigationBar bottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Appointment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (value) {
        if (value == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (value == 2) {
          // Handle Profile screen navigation
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        } else if (value == 3) {
          // Handle other screen navigation
        }
      },
    );
  }
}
