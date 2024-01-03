import 'package:demo123/network/db.dart';
import 'package:flutter/material.dart';
import 'package:demo123/utils/colors.dart';
import 'package:demo123/utils/icons.dart';
import 'package:demo123/utils/strings.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(abtcmp),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(arrowback)),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5),
          itemCount: FirebaseApi.brousherImagelist.length,
          itemBuilder: (context, index) {
            return RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage1(image: FirebaseApi.brousherImagelist[index]['url']),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(FirebaseApi.brousherImagelist[index]['url']),
                          fit: BoxFit.cover,
                        )),
                  ),
                ));
          }),
    );
  }
}
class ImageDetails {
  final String image;

  ImageDetails({
    required this.image,
  });
}

class DetailPage1 extends StatelessWidget {
  final String image;

  DetailPage1({required this.image});

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
                          // fit: BoxFit.cover,
                        )),
                  ))
            ],
          ),
        ));
  }
}