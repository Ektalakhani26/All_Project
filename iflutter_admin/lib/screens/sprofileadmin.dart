import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/dashboardadmin.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';
Widget common1container(context, Map dataprofile) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(flex: 2, child: Text(dataprofile['title'])),
        Text(' :   '),
        Expanded(flex: 3, child: Text(dataprofile['title1'])),
      ],
    ),
  );
}

class proadmin extends StatefulWidget {
  const proadmin({Key? key}) : super(key: key);

  @override
  _proState createState() => _proState();
}

class _proState extends State<proadmin> {
  File? img;

  selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    img = File(image!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                              Padding(padding: EdgeInsets.only(left: 110.0)),
                              Text(profile,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: white)),
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
                      // color: Colors.yellow,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              color: clrgrey,
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: (img != null)
                                    ? FileImage(img!)
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
                GestureDetector(
                    onTap: () {
                      selectImage();
                    },
                    child: Text(
                      editprofile,
                      style: TextStyle(fontSize: 16, color: blue),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: dataprofile.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return common1container(context, dataprofile[index]);
                      }),
                )
              ],
            ),
          ),
        ));
  }
}