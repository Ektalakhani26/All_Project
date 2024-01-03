import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';


Widget common1container(String key, String value) {
  // print(data1);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(flex: 2, child: Text(key)),
            Text(' :   '),
            Expanded(flex: 3, child: Text(value)),
          ],
        ),
        Divider(),
        // ListTile(
        //
        // )
      ],
    ),
  );
}

class pro1 extends StatefulWidget {
  pro1({Key? key}) : super(key: key);

  _pro1State createState() => _pro1State();
}

class _pro1State extends State<pro1> {
  // File? img;

  String url =
      'https://firebasestorage.googleapis.com/v0/b/abhb-aefd5.appspot.com/o/images%2Fuploadpro.webp?alt=media&token=025370cd-ed23-4b2b-a1e0-02b545818bee';

  getImage(String key) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);

    Reference storageReference = FirebaseStorage.instance
        .ref('images/')
        .child(DateTime.now().toString());

    ///UPLOAD IMAGE
    UploadTask task1 = storageReference.putFile(file!);

    print('++++');
    await (await task1).ref.getDownloadURL().then((value) {
      print('---$value');
      // print(value);
      // url = value;
      MyDataBase.setprofileImage(key, value).then((value) {
        Timer(Duration(seconds: 5), () {
          setState(() {});
        });
      });
    });
    setState(() {});
  }

  File? file;

  @override
  void initState() {
    super.initState();
    MyDataBase.selectUserData(userEmail).then((value) {
      setState(() {});

    });
  }

  Map selecteddataform = {};
  Map profilephoto = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  arrowback,
                                  color: white,
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Text(profile,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: white)),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width/4,),
                            IconButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return EditProfile();
                              }),).then((value) {
                                Timer(Duration(seconds: 2),(){
                                  setState(() {

                                  });
                                });
                              });
                            }, icon: Icon(icedit,color: white,))
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(200, 100.0)),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: clrgrey,
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            image: DecorationImage(

                              fit: BoxFit.cover,
                              image: (profile1['url']!= null)
                                  ? NetworkImage(profile1['url']!)
                                  : AssetImage('assett/abc.PNG') as ImageProvider,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              SizedBox(
                height: 20,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(

                    children: [
                      common1container('Name', profile1['Name'] ?? ''),
                      common1container('Addresss', profile1['Address'] ?? ''),
                      common1container('Email', profile1['Email'] ?? ''),
                      common1container('DateOfBirth', profile1['DateOfBirth'] ?? ''),
                      common1container('Personalmobile', profile1['Personalmobile'] ?? ''),
                      common1container('FathersNumber', profile1['FathersNumber'] ?? ''),
                      common1container('gender', profile1['gender'] ?? ''),
                      common1container('College', profile1['College'] ?? ''),
                      common1container('City', profile1['City'] ?? ''),
                      common1container('State', profile1['State'] ?? ''),
                      common1container('Country', profile1['Country'] ?? ''),
                      common1container('Pincode', profile1['Pincode'] ?? ''),
                      common1container('Course', profile1['Course'] ?? ''),
                      common1container('fees', profile1['fees'] ?? ''),
                      common1container('Bloodgroup', profile1['Bloodgroup'] ?? ''),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController nameController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController fmobController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();


  @override
  void initState() {
    nameController.text = profile1['Name'];
    addController.text=profile1['Address'];
    emailController.text= profile1['Email'];
    mobController.text=profile1['Personalmobile'];
    fmobController.text=profile1['FathersNumber'];
    collegeController.text=profile1['College'];
    cityController.text=profile1['City'];
    stateController.text=profile1['State'];
    countryController.text=profile1['Country'];
    pincodeController.text=profile1['Pincode'];


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(arrowback),
            color: white,
          ),
          title: Text(
            profile,
            style: TextStyle(color: white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 10,
                ),
                buildTextField('Name', nameController),
                buildTextField('Address', addController),
                buildTextField('Email', emailController),
                buildTextField('Personalmobile', mobController),
                buildTextField('FathersNumber', fmobController),
                buildTextField('College', collegeController),
                buildTextField('City', cityController),
                buildTextField('State', stateController),
                buildTextField('Country', countryController),
                buildTextField('Pincode', pincodeController),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(

                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:  Text(
                        cancel,
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: white),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        MyDataBase.updateRegister(
                          Name: nameController.text,
                          Address: addController.text,
                          Email :emailController.text,
                          Personalmobile:mobController.text,
                          FathersNumber:fmobController.text,
                          city: cityController.text,
                          College: collegeController.text,
                          Country: countryController.text,
                          State: stateController.text,
                          Pincode: pincodeController.text,
                          key: profile1['key'],
                        ).then((value) {
                          Navigator.of(context).pop(context);
                        });
                      },
                      child:  Text(
                        save,
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: white),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
