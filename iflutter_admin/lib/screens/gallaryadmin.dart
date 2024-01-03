import 'dart:async';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/dashboardadmin.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class ListGallaryAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListAState();
}

class ListAState extends State {
  @override
  void initState() {
    super.initState();
    MyDataBase.selectDataGallery().then((value) {
      setState(() {});
    });
  }

  Map selectedgallerydata = {};

  Widget commanContaineradmingallery(context, index,) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: white, //background color of box
            boxShadow: [
              BoxShadow(
                color: blue,
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  3.0, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),
          //color:  Color(0xff03508C),
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dayadmin(
                        MyDataBase.gallerydata[index]['gallerytitle'], index),
                    // index == 0
                    //     ? Dayadmin()
                    //     : index == 1
                    //     ? Touradmin()
                    //     : index == 2
                    //     ? Funadmin()
                    //     : index == 3
                    //     ? Eventadmin()
                    //     : FTouradmin(),
                  ));
            },
            tileColor: blue,
            title: Text(
              MyDataBase.gallerydata[index]['gallerytitle'] ?? '',
              style: TextStyle(color: black, fontSize: 18),
            ),
            // dataadgallery1['title'],
            // style: TextStyle(color: black,),),
            trailing: IconButton(
              onPressed: () {
                MyDataBase.deleteDataGallery(
                    keyvalue: MyDataBase.gallerydata[index]['key'] ?? '');
                selectedgallerydata.clear();
                selectedgallerydata = MyDataBase.gallerydata[index];
                MyDataBase.gallerydata.removeAt(index);
                //  data.removeWhere(index);
                setState(() {});
              },
              icon: Icon(icdelete, color: blue),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // String clr = 'Color(0xffF36F24)';
    // var index;
    TextEditingController titleController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },

            icon: Icon(arrowback, size: 25, color: white),
          ),
          title: Text(
            Gallery1,
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
          child: ListView.builder(
              itemCount: MyDataBase.gallerydata.length,
              itemBuilder: (context, index) {
                return commanContaineradmingallery(context, index,);
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(icadd),
          backgroundColor: blue,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(AddTitleName),
                      content: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: Titlename,
                          hintText: giveyourtitlename,
                        ),
                      ),
                      actions: [
                        MaterialButton(
                          color: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            cancel,
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        MaterialButton(
                          color: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          onPressed: () {
                            // print(MyDataBase.gallerydata);
                            MyDataBase.insertdatagallery(
                              gallerytitle: titleController.text,
                            );
                            MyDataBase.selectDataGallery();
                            setState(() {});
                            //   MyDataBase.selectDataGallery().then((value) {
                            //   setState(() {});
                            Navigator.pop(context);
                            //  });
                          },
                          //   dataadgallery.add({
                          //     "title": titleController.text,
                          //     "images": [],
                          //   });
                          //   print(dataadgallery.toString());
                          //   setState(() {
                          //     Navigator.pop(context);
                          //   });
                          // },
                          child: Text(
                            Add,
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ));
          },
        ),
      ),
    );
  }
}

///Galleryimage

class Dayadmin extends StatefulWidget {
  int index;
  String title;

  Dayadmin(this.title, this.index, {Key? key}) : super(key: key);

  @override
  State<Dayadmin> createState() => DayadminState();
}

class DayadminState extends State<Dayadmin> {
  List images = [];

  // File? img;
  // selectImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   dataadgallery[widget.index]['images'].add(File(image!.path));
  //   setState(() {});
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   images.clear();
  //   dataadgallery.forEach((element) {
  //     if (element['title'] == widget.title) images.add(element['images']);
  //   });
  //   print(images);
  // }
  getImage(String key) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);

    Reference storageReference = FirebaseStorage.instance
        .ref('images/')
        .child(DateTime.now().toString());

    ///UPLOAD IMAGE
    UploadTask task = storageReference.putFile(file!);

    ///GET URL
    await (await task).ref.getDownloadURL().then((value) {
      print('======$value');
      MyDataBase.setGalleryImage(key,value).then((value) {
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
    MyDataBase.getGalleryImage(MyDataBase.gallerydata[widget.index]['key']).then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {});
      });
    });
  }

  Map Galleryimage = {};

  @override
  Widget build(BuildContext context) {
    print('======${MyDataBase.gallerydata[widget.index]['key']}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(ListGallaryAdmin());
            },
            icon: Icon(
              arrowback,
              color: white,
            )),
        title: Text(
          widget.title,
          style: TextStyle(color: white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                getImage(MyDataBase.gallerydata[widget.index]['key']);
              },
              icon: Icon(icadd)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1),
            itemCount: MyDataBase.galleryImagelist.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height / 1,
                    height: MediaQuery.of(context).size.height / 1,
                    decoration: BoxDecoration(
                      color: grey,
                      image: DecorationImage(
                        image: (MyDataBase.galleryImagelist.length > 0)
                            ? NetworkImage(
                                MyDataBase.galleryImagelist[index]['url'])
                            : AssetImage('assett/ABC.jpg') as ImageProvider,
                        // image: (MyDataBase.galleryImagelist.length > 0)
                        //     ? FileImage(images[index])
                        //     : AssetImage('assett/abc.PNG') as ImageProvider,
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
                          setState(() {
                            MyDataBase.deleteDatagalleryimage(
                                keyvalue: MyDataBase.galleryImagelist[index]['key'] ?? '');
                            Galleryimage.clear();
                            Galleryimage = MyDataBase.galleryImagelist[index];
                            MyDataBase.galleryImagelist.removeAt(index);
                            // MyDataBase.galleryImagelist.removeAt(index);
                          });
                        },
                        icon: Icon(
                          icdelete,
                          size: 15,
                          color: white,
                          // textDirection: TextDirection.ltr,
                        )),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
