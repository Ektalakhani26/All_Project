
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BottomBar.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.blue.shade900),
          onPressed: () {
            // Handle drawer button press
            // You can open the drawer here
          },
        ),
        title: Center(
          child: Text(
            " My Appointment",
            style: TextStyle(
                color: Colors.blue.shade900, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue.shade900, size: 23),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.blue.shade900),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
        backgroundColor: Colors.blue.shade200,
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage("assets/healthCare.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Let's Find your Doctor !",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(11),
                          child: Container(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image(
                                image:
                                AssetImage("assets/female_doctor.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("July",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  Icon(Icons.favorite_border,
                                      color: Colors.blue.shade900, size: 25),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                //  Icon(Icons.location_on_outlined,
                                      // color: Colors.black45, size: 20),
                                  SizedBox(width: 5),
                                  Text('Eye Surgine',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue.shade900)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.call, size: 15, color: Colors.black45),
                                  SizedBox(width: 5),
                                  Text('+91 9664925454',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black45)),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Details_Doctors(),));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // Background color
                                onPrimary: Colors.blue.shade900, // Text color
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text("View profile"),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.43,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle the button press
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade900, // Set the background color
                              ),
                              child: Text(
                                'Book Appointment',
                                style: TextStyle(
                                  color: Colors.white, // Set the text color
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(11),
                          child: Container(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image(
                                image:
                                AssetImage("assets/female_doctor.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("July",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  Icon(Icons.favorite_border,
                                      color: Colors.blue.shade900, size: 25),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  //  Icon(Icons.location_on_outlined,
                                  // color: Colors.black45, size: 20),
                                  SizedBox(width: 5),
                                  Text('Eye Surgine',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue.shade900)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.call, size: 15, color: Colors.black45),
                                  SizedBox(width: 5),
                                  Text('+91 9664925454',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black45)),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // Background color
                                onPrimary: Colors.blue.shade900, // Text color
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text("View profile"),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.43,
                            alignment: Alignment.center,
                            child:   ElevatedButton(
                              onPressed: () {
                                // Handle the button press
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade900, // Set the background color
                              ),
                              child: Text(
                                'Book Appointment',
                                style: TextStyle(
                                  color: Colors.white, // Set the text color
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(11),
                          child: Container(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image(
                                image:
                                AssetImage("assets/female_doctor.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text("July",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  Icon(Icons.favorite_border,
                                      color: Colors.blue.shade900, size: 25),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  //  Icon(Icons.location_on_outlined,
                                  // color: Colors.black45, size: 20),
                                  SizedBox(width: 5),
                                  Text('Eye Surgine',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue.shade900)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.call, size: 15, color: Colors.black45),
                                  SizedBox(width: 5),
                                  Text('+91 9664925454',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black45)),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // Background color
                                onPrimary: Colors.blue.shade900, // Text color
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text("View profile"),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.43,
                            alignment: Alignment.center,
                            child:  ElevatedButton(
                              onPressed: () {
                                // Handle the button press
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade900, // Set the background color
                              ),
                              child: Text(
                                'Book Appointment',
                                style: TextStyle(
                                  color: Colors.white, // Set the text color
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Repeat similar code for the other two sections
          ],
        ),
      ),
      bottomNavigationBar: BottomBar.bottomNavigation(context),

    );
  }
}

class Details_Doctors extends StatefulWidget {
  const Details_Doctors({Key? key}) : super(key: key);

  @override
  State<Details_Doctors> createState() => _Details_DoctorsState();
}

class _Details_DoctorsState extends State<Details_Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200, // Set the background color to white
        foregroundColor: Colors.black, // Set the text color to black
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.blue.shade900), onPressed: () {
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text("Dr. Details",style: TextStyle(fontSize: 25,color: Colors.blue.shade900)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/doctor1.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    padding: EdgeInsets.all(10),
                    decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow.shade700, size: 22),
                            SizedBox(width: 5),
                            Text(
                              '5.0 ',
                              style: TextStyle(fontSize: 14, color: Colors.black87,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    padding: EdgeInsets.all(10),
                    decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'patients',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Icon(Icons.star, color: Colors.yellow, size: 22),
                            SizedBox(width: 5),
                            Icon(Icons.person_2_rounded,color: Colors.blue.shade900),
                            Text(
                              '10K ',
                              style: TextStyle(fontSize: 14, color: Colors.black87,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 3,
              margin: EdgeInsets.all(20),
              child: ListTile(
                contentPadding: EdgeInsets.all(30),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: Dr. july',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Category: Eyes Specialist',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Location: utran,surat',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Mobile Number: +91 9664925454',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Time : 10:00 am To 8:00 pm',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.edit, color: Colors.black),
                  ),
                  hintText: "Enter The Reason",
                 // labelText: 'Date of Birth',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.calendar_month, color: Colors.black),
                  ),
                  hintText: "Select Date For  Appointment ",
                  // labelText: 'Date of Birth',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.watch_later_outlined, color: Colors.black),
                  ),
                  hintText: "Select Time For  Appointment ",
                  // labelText: 'Date of Birth',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle the button press
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade900, // Set the background color
              ),
              child: Text(
                'Book Appointment',
                style: TextStyle(
                  color: Colors.white, // Set the text color
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




