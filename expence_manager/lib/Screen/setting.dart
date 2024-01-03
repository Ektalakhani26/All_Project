import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../model/db_helper.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  List<Map<String, dynamic>> _journals = [];

  final TextEditingController _busncontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();

  void _refreshJournals() async {
    final data = await SQLHelper.getItems1();
    setState(() {
      _journals = List<Map<String, dynamic>>.from(data);
      print(_journals);
    });
  }

  File? _image;
  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }


  Future<void> _addItem() async {
    File imageFile = File(_image!.path);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String imagePath = '${appDocDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';
    await imageFile.copy(imagePath);

    await SQLHelper.profileItem(
      _busncontroller.text,
      _namecontroller.text,
      imagePath,  // Save the image path instead of _image!.path
    );

    _refreshJournals();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshJournals();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _busncontroller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    if(_journals.isNotEmpty) {
      var a = _journals.length - 1;
      _namecontroller.text = _journals[a]['name'] ?? '';
      _busncontroller.text = _journals[a]['businessname'] ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('Edit Book Info',style:TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          maxRadius: 50,
                          //  child: Txt('MB',fontSize: 35,color: Colors.white,),
                          backgroundImage: (_image != null)
                              ? FileImage(_image!)
                              : (_journals.isNotEmpty && _journals.last['image'] != null)
                              ? FileImage(File(_journals.last['image']))  // Use the stored image path
                              : AssetImage('assets/mb.png') as ImageProvider<Object>,
                        ),
                        CircleAvatar(
                          maxRadius: 15,
                          child: InkWell(
                              onTap: () async {
                                await _openImagePicker();
                                setState(() {
                                });
                              },
                              child: Icon(Icons.camera_enhance)),
                          backgroundColor: Colors.white,
                        ),
                      ]
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Upload Photo'),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Business Name',style:TextStyle(fontWeight: FontWeight.w600)),
                  Text('Edit',style:TextStyle(color: Colors.blue.shade900,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _busncontroller,
                decoration: InputDecoration(
                    hintText: 'My Business',
                    labelText: 'Business Name',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your Name',style:TextStyle(fontWeight: FontWeight.w600)),
                  Text('Edit',style:TextStyle(color: Colors.blue.shade900,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                    labelText: ' Name',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async {

              await _addItem();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                backgroundColor: Colors.green,
                content: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white),
                    Expanded(child: Text('Profile information has been added Successfully',
                        style: TextStyle(color: Colors.white))),],
                ),
              ));
              setState(() {

              });
            }, child: Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Text("SAVE"),
            )),
          ],
        ),
      ),

    );
  }
}