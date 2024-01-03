import 'package:bank_app/BottomNavigationBar/BottomNavigationbar.dart';
import 'package:bank_app/screens/HomeScreen.dart';
import 'package:bank_app/screens/Productscreen.dart';
import 'package:flutter/material.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({Key? key}) : super(key: key);

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: MyFun.bottomNavigation(context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
       // leading: Icon(Icons.add,color: Colors.black),
        title: Text('Jewellery Shop',style: TextStyle(color: Colors.black)),
        actions: [
          Icon(Icons.favorite,color: Colors.red),
          SizedBox(width: 10,),
          Icon(Icons.add_shopping_cart,color: Colors.black),
          SizedBox(width: 10,),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Himaxi Chodvadiya',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              accountEmail: Text('himaxichodvadiya@gmai.com',style: TextStyle(fontWeight: FontWeight.bold)),
              decoration:BoxDecoration(
                  gradient: LinearGradient(colors:
                  [Colors.red,Colors.green,Colors.deepPurpleAccent,Colors.blueAccent,Colors.yellowAccent,Colors.cyan,Colors.lightGreen,Colors.pink,Colors.purpleAccent])),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/himaxi.jpeg'),
              ),
              onDetailsPressed: () {
              },
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              child: ListTile(
                leading: Icon(Icons.home,color: Colors.red,size: 30),
                title: Text('Home'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
              },
              child: ListTile(
                leading: Icon(Icons.pix_rounded,size: 30),
                title: Text('Product'),
              ),
            ),
            Container(
              height: 3,
              width: size.width,
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(Icons.drafts,size: 30),
              title: Text('Drafts'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_on_sharp,size: 200,),
            Text("You don't have any notifications as of now"),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            }, child: Text('START SHOPPING')),
          ],
        ),
      ),
    );
  }
}