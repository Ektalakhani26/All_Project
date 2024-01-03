import 'package:flutter/material.dart';

class MyRewards extends StatelessWidget {
  const MyRewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('M',style: TextStyle(color: Colors.yellow,fontSize: 70)),
              Text('Hey,',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 40),),
              Container(
                padding: EdgeInsets.only(left: 50),
                  child: Text("What's up",style: TextStyle(fontSize: 30)),
              ),
              Container(
                width: 350,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.black12, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.search),
                    Container(
                      padding: EdgeInsets.only(right: 200),
                      child:
                      Text('Search', style: TextStyle(color: Colors.black26)),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                            child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 25,
                          //padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            //padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.red.shade600,borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Image(image: AssetImage('assets/b7.jpg')),
                        ),
                        Text('Big Burgar',style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text('20% off',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
