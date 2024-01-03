import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: MediaOrientation(),
      ),
    );
  }
}

class MediaOrientation extends StatefulWidget {
  const MediaOrientation({Key? key}) : super(key: key);
  @override
  State<MediaOrientation> createState() => _MediaOrientationState();
}

class _MediaOrientationState extends State<MediaOrientation> {
  var hi;
  var wi;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //hi= size.width*0.3-20;
   // wi=size.width*0.3-20;
    double boxwidth = size.width*0.3-20;
    double boxheight = size.height*0.3-20;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Center(
        child: (orientation == Orientation.landscape) ?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: WidgetOrientation(boxwidth),
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: WidgetOrientation(boxheight),
        ),
      ),
    );
  }

  WidgetOrientation(double boxsize) {
    var width = boxsize;
    var height = boxsize;
    return [
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: Colors.lightGreenAccent,borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                maxRadius: height/20,
                minRadius: height/20,
                backgroundImage: AssetImage('assets/ekta.jpg'),
              ),
              title: Text('Ekta Lakhani',style: TextStyle(fontSize: height/15)),
              subtitle: Text('Last Seen 4:00 AM',style: TextStyle(fontSize: height/15)),
            ),
            SizedBox(height: 12,),
            CircleAvatar(
              maxRadius: height/3.15,
              minRadius: height/20,
              backgroundImage: AssetImage('assets/ekta.jpg'),
            ),
          ],
        ),
      ),
      SizedBox(height: 10,width: 10,),
      Container(
        height: boxsize,
        width: boxsize,
        decoration: BoxDecoration(color: Colors.tealAccent,borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/sangita.jpg'),
              ),
              title: Text('Sangita Chadhry',style: TextStyle(fontSize: boxsize/15)),
              subtitle: Text('Last Seen 5:00 PM',style: TextStyle(fontSize: boxsize/15)),
            ),
            SizedBox(height: 12,),
            CircleAvatar(
              maxRadius: boxsize/3.15,
              minRadius: boxsize/6,
              backgroundImage: AssetImage('assets/sangita.jpg'),
            ),
          ],
        ),
      ),
      SizedBox(height: 10,width: 10,),
      Container(
        height: boxsize,
        width: boxsize,
        decoration: BoxDecoration(color: Colors.pinkAccent,borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/kaushik.jpg'),
              ),
              title: Text('Kaushik Dhapa',style: TextStyle(fontSize: boxsize/15)),
              subtitle: Text('Last Seen 4:15 PM',style: TextStyle(fontSize: boxsize/15)),
            ),
            SizedBox(height: 12,),
            CircleAvatar(
              maxRadius: boxsize/3.15,
              minRadius: boxsize/6,
              backgroundImage: AssetImage('assets/kaushik.jpg'),
            ),
          ],
        ),
      ),
    ];
    
  }
}
