import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Update Profile",
          style: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade200,
        // elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 60,
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : AssetImage('assets/profile_logo.png') as ImageProvider<Object>?,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _getImage();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,
                ),
                child: Text(
                  'Add Image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  hintText: "Enter Name",
                  labelText: 'Name ',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 18.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.call, color: Colors.black),
                  ),
                  hintText: "Enter Number",
                  labelText: 'Number',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 18.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.calendar_month, color: Colors.black),
                  ),
                  hintText: "Select BirthDate",
                  labelText: 'BirthDate',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 30),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.45,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade900,
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
