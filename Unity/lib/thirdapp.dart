import 'package:flutter/material.dart';

class thirdApp extends StatelessWidget {
  const thirdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [

            Container(
              width: 410,
              height: 800,
              decoration: BoxDecoration(gradient: SweepGradient(colors: [Colors.pink,Colors.blue,Colors.yellow,Colors.green,Colors.deepPurple,Colors.red])),
              child: Container(

                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        minRadius: 10,
                        maxRadius: 200,
                        backgroundColor: Colors.black26,
                        //backgroundImage: AssetImage('assets/'),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      //padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 190,
                        minRadius: 10,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 180,
                        minRadius: 100,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 170,
                        minRadius: 100,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 160,
                        minRadius: 100,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 150,
                        minRadius: 100,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 140,
                        minRadius: 100,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 130,
                        minRadius: 100,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 120,
                        minRadius: 100,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 110,
                        minRadius: 100,
                        backgroundColor: Colors.pinkAccent.shade100,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 100,
                        minRadius: 100,
                        backgroundColor: Colors.pink,
                        backgroundImage: AssetImage('assets/neha.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 650,
              left: 30,
              child: Container(
                height: 5,
                width: 180,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 640,
              left: 200,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(color: Colors.deepPurpleAccent.shade700,borderRadius: BorderRadius.circular(20)),
                child: Icon(Icons.circle,size: 15,color: Colors.white),

              ),
            ),
            Positioned(
              top: 650,
              left: 225,
              child: Container(
                height: 5,
                width: 150,
                color: Colors.black26,
              ),
            ),
            Positioned(
              top: 600,
              left: 140,
              child: Container(
                child: Text('Dil Ko Karar Aaya',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              ),
            ),
            Positioned(
              top: 718,
              left: 105,
              child: Container(
                child: Icon(Icons.skip_previous,size: 30),
              ),
            ),
            Positioned(
              top: 708,
              left: 180,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(color: Colors.deepPurpleAccent.shade700,borderRadius: BorderRadius.circular(30)),
              child: Icon(Icons.pause,color: Colors.white),
              ),
            ),
            Positioned(
              top: 718,
              left: 270,
              child: Container(
                child: Icon(Icons.skip_next,size: 30),
              ),
            ),
            Positioned(
              top: 660,
              left: 30,
              child: Container(
                child: Text('02:00'),
              ),
            ),
            Positioned(
              top: 660,
              left: 330,
              child: Container(
                child: Text('04:30'),
              ),
            ),
            Positioned(
              top: 718,
              left: 340,
              child: Container(
                child: Icon(Icons.shuffle,size: 30),
              ),
            ),
            Positioned(
              top: 60,
              left: 320,
              child: Container(
                child: Icon(Icons.favorite,size: 30,color: Colors.pink),
              ),
            ),
            Positioned(
              top: 717,
              left: 25,
              child: Container(
                child: Icon(Icons.autorenew,size: 30),
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: Container(
                child: Icon(Icons.arrow_back,size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
