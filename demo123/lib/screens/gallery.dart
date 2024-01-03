import 'dart:async';
import 'dart:io';

import 'package:demo123/network/db.dart';
import 'package:flutter/material.dart';
import 'package:demo123/screens/brousher.dart';
import 'package:demo123/utils/colors.dart';
import 'package:demo123/utils/icons.dart';
import 'package:demo123/utils/strings.dart';
import 'package:image_picker/image_picker.dart';

Widget commanContainersgal(context, index, Map datagallery) {
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
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Day(FirebaseApi.gallerydata[index]['key'])));
        },
        tileColor: blue,
        title: Text(
          FirebaseApi.gallerydata[index]['gallerytitle'],
          style: TextStyle(
            color: black,
          ),
        ),
        // trailing: FirebaseApi.gallerydata[index]['icondata'],
      ),
    ),
  );
}

class ListGallarystudent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListstudentState();
}

class ListstudentState extends State {
  @override
  void initState() {
    super.initState();
    FirebaseApi.selectDataGallery().then((value) {
      // print(FirebaseApi.gallerydata.length);
    });
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          gallery,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: ListView.builder(
            itemCount: FirebaseApi.gallerydata.length,
            itemBuilder: (context, index) {
              return commanContainersgal(
                  context, index, FirebaseApi.gallerydata[index]);
            }),
      ),
    );
  }
}

class Day extends StatefulWidget {
  final String galleryKey;

  Day(this.galleryKey);

  @override
  State<Day> createState() => DayState();
}

class DayState extends State<Day> {
  File? img;

  selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    img = File(image!.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print('******${widget.galleryKey}');
    FirebaseApi.getGalleryImage(widget.galleryKey).then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(ListGallarystudent());
            },
            icon: Icon(
              arrowback,
              color: white,
            )),
        title: Text(
          Img,
          style: TextStyle(color: white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 1.5),
            itemCount: FirebaseApi.galleryImagelist.length,
            itemBuilder: (context, index) {
              return RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage1(
                            image: FirebaseApi.galleryImagelist[index]['url']),
                      ));
                },
                child: Stack(
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.height / 10,
                      //height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        color: grey,
                        image: DecorationImage(
                          image: NetworkImage(
                              FirebaseApi.galleryImagelist[index]['url']),
                          fit: BoxFit.cover,
                          // image: AssetImage(dataday[index]['image']),
                          //fit:BoxFit.cover,
                        ),
                      ),
                    ),

                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ImageDetails0 {
  final String image;

  ImageDetails0({
    required this.image,
  });
}

class DetailPage01 extends StatelessWidget {
  final String image;

  DetailPage01({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                  image: NetworkImage(image),
                )),
          ))
        ],
      ),
    ));
  }
}

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => EventState();
}

class EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(ListGallarystudent());
            },
            icon: Icon(
              arrowback,
              color: white,
            )),
        title: Padding(
          padding: const EdgeInsets.all(65.0),
          child: Text(
            Img,
            style: TextStyle(color: white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 1.5),
            itemCount: 12,
            itemBuilder: (context, index) {
              return RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage1(image: dataevent[index]['image']),
                      ));
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: grey,
                        image: DecorationImage(
                          image: AssetImage(dataevent[index]['image']),
                          //fit:BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: grey,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            iccircle,
                            color: white,
                          )),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ImageDetails12 {
  final String image;

  ImageDetails12({
    required this.image,
  });
}

class DetailPage112 extends StatelessWidget {
  final String image;

  DetailPage112({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage(image),
                  // fit: BoxFit.cover,
                )),
          ))
        ],
      ),
    ));
  }
}

class FTour extends StatefulWidget {
  const FTour({Key? key}) : super(key: key);

  @override
  State<FTour> createState() => FTourState();
}

class FTourState extends State<FTour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: id1,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(ListGallarystudent());
            },
            icon: Icon(
              arrowback,
              color: white,
            )),
        title: Padding(
          padding: const EdgeInsets.all(65.0),
          child: Text(
            Img,
            style: TextStyle(color: white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 1.5),
            itemCount: 12,
            itemBuilder: (context, index) {
              return RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage1(image: dataftour[index]['image']),
                      ));
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: grey,
                        image: DecorationImage(
                          image: AssetImage(dataftour[index]['image']),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: black,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            iccircle,
                            color: white,
                            // textDirection: TextDirection.ltr,
                          )),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ImageDetails123 {
  final String image;

  ImageDetails123({
    required this.image,
  });
}

class DetailPage1123 extends StatelessWidget {
  final String image;

  DetailPage1123({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage(image),
                )),
          ))
        ],
      ),
    ));
  }
}
