import 'package:flutter/material.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({Key? key}) : super(key: key);

  @override
  State<Drawer1> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer1> {
  var a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Google Classroom'),
         elevation: 200,
         actions: [
           Icon(Icons.more_vert),
         ],
         // leading: Icon(Icons.cabin),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.amber,onPressed: () {
        
      },child: Icon(Icons.add),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('Ekta Lakhani'),
                  accountEmail: Text('ektalakhani26@gmai.com'),
                decoration:BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.green,Colors.deepPurpleAccent,Colors.blueAccent,Colors.yellowAccent,Colors.cyan,Colors.lightGreen,Colors.pink,Colors.purpleAccent])),
                currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/ekta2.jpg'),
                ),
                onDetailsPressed: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.move_to_inbox,color: Colors.red,size: 30),
                title: Text('Inbox'),
              ),
              ListTile(
                leading: Icon(Icons.star,size: 30),
                title: Text('Starred'),
              ),
              ListTile(
                leading: Icon(Icons.send,size: 30),
                title: Text('Sent mail'),
              ),
              ListTile(
                leading: Icon(Icons.drafts,size: 30),
                title: Text('Drafts'),
              ),
              Container(
                height: 1,
                color: Colors.black12,
              ),
              ListTile(
                leading: Icon(Icons.mail,size: 30),
                title: Text('All mail'),
              ),
              ListTile(
                leading: Icon(Icons.delete,size: 30),
                title: Text('Trash'),
              ),
              ListTile(
                leading: Icon(Icons.sim_card_alert_outlined,size: 30),
                title: Text('Spam'),
              ),
            ],
          ),
      ),
    );
  }
}
