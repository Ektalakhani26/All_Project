
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/Pages/Brands.dart';
import 'package:myntra/Pages/Cart.dart';
import 'package:myntra/Pages/HomePage.dart';
import 'package:myntra/Pages/Profile.dart';
//
// class MyFun{
//
//   static BottomNavigationBar bottomNavigation(context)
//   {int selectedIndex = 0;
//     return BottomNavigationBar(
//       currentIndex: selectedIndex,
//       selectedLabelStyle: TextStyle(color: Colors.orange), // Set selected label color
//       unselectedLabelStyle: TextStyle(color: Colors.grey),
//       selectedItemColor: Colors.orange,
//       type: BottomNavigationBarType.fixed,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home,color: selectedIndex == 0 ? Colors.orange : Colors.grey),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.discount,color: selectedIndex == 1 ? Colors.orange : Colors.grey),
//           label: 'Brands',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.add_shopping_cart,color: selectedIndex == 2 ? Colors.orange : Colors.grey),
//           label: 'Cart',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.supervised_user_circle_outlined,color: selectedIndex == 3 ? Colors.orange : Colors.grey),
//           label: 'You',
//         ),
//       ],
//       onTap: (value) {
//         selectedIndex = value;
//         print(value);
//         if(value==0)
//           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
//         else if(value==1)
//           Navigator.push(context, MaterialPageRoute(builder: (context) => BrandScreen(),));
//         else if(value==2)
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCart(),));
//         else if(value==3)
//           Navigator.push(context, MaterialPageRoute(builder: (context) => YouScreen(),));
//       },
//     );
//   }
// }

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
          icon: Icon(Icons.discount, color: selectedIndex == 1 ? Colors.orange : Colors.grey),
          label: 'Brands',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart, color: selectedIndex == 2 ? Colors.orange : Colors.grey),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined, color: selectedIndex == 3 ? Colors.orange : Colors.grey),
          label: 'You',
        ),
      ],
      onTap: (value) {
        selectedIndex = value; // Update selectedIndex when an item is tapped
        print(value);
        if (value == 0)
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        else if (value == 1)
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandScreen(),));
        else if (value == 2)
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCart(),));
        else if (value == 3)
          Navigator.push(context, MaterialPageRoute(builder: (context) => YouScreen(),));
      },
    );
  }
}