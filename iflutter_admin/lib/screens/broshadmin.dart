import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/dashboardadmin.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class broshadmin extends StatefulWidget {
  const broshadmin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Gallery3();
}

class Gallery3 extends State {
  getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);

    Reference storageReference = FirebaseStorage.instance
        .ref('images/')
        .child(DateTime.now().toString());

    ///UPLOAD IMAGE
    UploadTask task2 = storageReference.putFile(file!);

    ///GET URL
    await (await task2).ref.getDownloadURL().then((value) {
      print('======$value');
      MyDataBase.setBrousherImage(value).then((value) {
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
    MyDataBase.getBrousherImage().then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {});
      });
    });
  }
Map brousher = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                arrowback,
                color: white,
              )),
          title: Text(
            images1,
            style: TextStyle(color: white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  getImage();
                },
                icon: Icon(icadd)),
          ],
          backgroundColor: blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1),
            itemCount: MyDataBase.brousherImagelist.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height / 1,
                    height: MediaQuery.of(context).size.height / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: grey,
                      image: DecorationImage(
                        // fit: BoxFit.cover, image: NetworkImage(url)
                        image: (MyDataBase.brousherImagelist.length > 0)
                            ? NetworkImage(
                                MyDataBase.brousherImagelist[index]['url'])
                            : AssetImage('assett/ABC.jpg') as ImageProvider,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: black,
                    ),
                    child: IconButton(
                        onPressed: () {
              MyDataBase.deleteDatabrousher(
              keyvalue: MyDataBase.brousherImagelist[index]['key']??'');
              brousher.clear();
              brousher = MyDataBase.brousherImagelist[index];
              MyDataBase.brousherImagelist.removeAt(index);
              //  data.removeWhere(index);
              setState(() {});

                          // setState(() {
                          //   MyDataBase.brousherImagelist.removeAt(index);
                          // });
                        },
                        icon: Icon(
                          icdelete,
                          size: 15,
                          color: white,
                        )),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
