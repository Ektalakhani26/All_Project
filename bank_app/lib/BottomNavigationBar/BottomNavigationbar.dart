
import 'package:bank_app/screens/Account.dart';
import 'package:bank_app/screens/HomeScreen.dart';
import 'package:bank_app/screens/Productscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFun {
  static int selectedIndex = 0; // Move selectedIndex outside the function

  static BottomNavigationBar bottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedLabelStyle: TextStyle(color: Colors.orange), // Set selected label color
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      selectedItemColor: Colors.orange,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: selectedIndex == 0 ? Colors.orange : Colors.grey),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pix, color: selectedIndex == 1 ? Colors.orange : Colors.grey),
          label: 'Product',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined, color: selectedIndex == 2 ? Colors.orange : Colors.grey),
          label: 'Account',
        ),
      ],
      onTap: (value) {
        selectedIndex = value; // Update selectedIndex when an item is tapped
        print(value);
        if (value == 0)
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        else if (value == 1)
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
        else if (value == 2)
          Navigator.push(context, MaterialPageRoute(builder: (context) => AccountProfile(),));
      },
    );
  }
}