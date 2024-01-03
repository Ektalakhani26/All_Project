import 'package:exam1/pageviewbulider/modelclass.dart';
import 'package:flutter/material.dart';

import '../Theme/themedata.dart';

class OtherScreen extends StatefulWidget {

   OtherScreen(Model listofstory, {Key? key}) : super(key: key);

    Model? obj;
    OtherScreen.pera(this.obj);
  @override
  State<OtherScreen> createState() => _OtherScreenState(obj!);
}

class _OtherScreenState extends State<OtherScreen> {
  Model obj;
  _OtherScreenState(this.obj);
 // List color=[Colors.green,Colors.blue,Colors.indigo];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('PageView Bulider')),
      body:Center(
        widthFactor: 10,
        child:  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${obj.name}',style: myTextstyle40(txtcolor: Colors.black)),
              SizedBox(height: 15),
              Container(
                width: 300,
                height: 250,
                color: obj.color,
                //decoration: BoxDecoration(color: color[index]),
                child:  Image(image: AssetImage('${obj.img}')),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.all(20),
                child:  Text('${obj.desc}',style: myTextstyle15(txtcolor: Colors.black)),
              ),
            ],
          ),
        ),

      ) ,

    );
  }
}
