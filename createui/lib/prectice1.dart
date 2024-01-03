import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Material App',
      home: Scaffold(
        //appBar: AppBar(
          //title: Text('App'),
        //),
        body: Column(
          children: [
            Row(
                children: [
                    Container(
                        child: Icon(Icons.dehaze_rounded,size: 40),
                      margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
                    ),
                    Container(
                      child: Icon(Icons.account_balance,size: 40),
                      margin: EdgeInsets.fromLTRB(270, 50, 0, 0),
                    ),

            ],
            ),
            Container(
                child: Text("Good Evening",style: TextStyle(fontSize: 20)),
                alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            ),
            Container(
              child: Text("Amanda Alex",style: TextStyle(fontSize: 30)),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            ),

            Container(
              width: 350,
              height: 180,
              decoration: BoxDecoration(color: Colors.blue.shade900,borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              //alignment: Alignment.centerLeft,
              child: Column(
                children: [

                      Row(
                        children: [
                          Container(
                              child: Text('CARD NUMBER',style: TextStyle(color: Colors.white)),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                            padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                          ),
                          Container(
                            child: Icon(Icons.account_circle_sharp,color: Colors.white),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(170, 30, 0, 0),
                          ),
                        ],
                      ),

                  Container(
                    child: Text('**** **** **** 1425',style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    alignment: Alignment.centerLeft,
                  ),

                  Row(
                    children: [
                      Container(
                        child: Text("CARD HOLDERNAME",style: TextStyle(color: Colors.white)),
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                      ),
                      Container(
                        child: Text("EXPIRY DATE",style: TextStyle(color: Colors.white)),
                        margin: EdgeInsets.fromLTRB(10, 35, 0, 0),
                        padding: EdgeInsets.fromLTRB(45, 5, 0, 0),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        child: Text("Amanda Alex",style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.white)),
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      ),
                      Container(
                        child: Text("03-01-2023",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
                        margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                       // alignment: Alignment.bottomRight,
                        padding: EdgeInsets.fromLTRB(95, 0, 0, 0),
                      ),
                    ],
                  ),
                    ],
                  ),

            ),
            Row(
              children: [
                Container(
                  child: Text("operation",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(10,  10, 0, 0),
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                ),
                Container(
                  width: 10,
                    height: 10,
                    margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                  decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(30)),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                  decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(30)),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  padding: EdgeInsets.fromLTRB(5, 25, 0, 0),
                  decoration: BoxDecoration(color: Colors.blue.shade900,borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [

                      Icon(Icons.monetization_on_outlined,size: 40,color: Colors.white),

                       Text('Money',style: TextStyle(color: Colors.white)),
                       Text('Transfer',style: TextStyle(color: Colors.white),),

                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                      padding: EdgeInsets.fromLTRB(5, 25, 0, 0),
                      decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Icon(Icons.food_bank_outlined,size: 45,color: Colors.blue.shade900),
                          Text('Bank',style: TextStyle(color: Colors.black54)),
                          Text('Withdraw',style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                      padding: EdgeInsets.fromLTRB(5, 25, 0, 0),
                      decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Icon(Icons.search_off,size: 45,color: Colors.blue.shade900),
                          Text('Insights',style: TextStyle(color: Colors.black54)),
                          Text('Tracking',style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Text('Transaction Histories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            ),
            Column(
              children: [
                Container(
                  width: 380,
                  height: 70,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: EdgeInsets.fromLTRB(30, 5, 0, 0),

                  decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Text('UBER',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Column(
                          children: [
                            Text('Uber Ride',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                            Text('1st Apr 2020',style: TextStyle(color: Colors.black26),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                          child: Row(
                            children: [
                              Text("-\$35.214",style: TextStyle(color: Colors.blue.shade900,fontSize: 20)),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 380,
                  height: 70,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                  decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Text('NIKE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Column(
                          children: [
                            Text('Nike Outlet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                            Text('30th Mar 2020',style: TextStyle(color: Colors.black26),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
                        child: Row(
                          children: [
                            Text("-\$100.00",style: TextStyle(color: Colors.blue.shade900,fontSize: 20)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 380,
                  height: 38,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                  decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle_sharp,size: 35,color: Colors.black12),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          children: [
                            Text('Peyment Receive',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black12)),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                        child: Row(
                          children: [
                            Text("+\$250.00",style: TextStyle(color: Colors.pinkAccent.shade100,fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),


      )

    );
  }
}
