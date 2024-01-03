import 'package:flutter/material.dart';
import 'book/pro1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade900,
          title: Text('Tools App Bar'),
        ),
         body: Exam1(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.feed_outlined,color: Colors.orange,size: 30),
              label: 'Feed',
              //backgroundColor: Colors.black12
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps,color: Colors.black26,size: 30),
              label: 'Tools',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups,color: Colors.black26,size: 30),
              label: 'Teaes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mark_unread_chat_alt_sharp,color: Colors.black26,size: 30),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,color: Colors.black26,size: 30),
              label: 'Dashboard',
            ),
          ],
          selectedItemColor: Colors.orange,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black26,
        ),
      ),
    );
  }
}

class Exam1 extends StatefulWidget {
  const Exam1({Key? key}) : super(key: key);

  @override
  State<Exam1> createState() => _Exam1State();
}

class _Exam1State extends State<Exam1> {
  List<Tools1> tool=[];
  List color=[Colors.yellow.shade700,Colors.blueAccent,Colors.green,Colors.red,Colors.blueAccent.shade700,Colors.pink];
  List<IconData> icon=[Icons.add_chart,Icons.account_balance,Icons.message_outlined,Icons.apps,Icons.add_chart,Icons.style_outlined];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tool.add(Tools1('Top 5', 'Last used 5 days ago'));
    tool.add(Tools1('Actions', 'Last used 2 days ago'));
    tool.add(Tools1('JEP', 'Last used 2 weeks ago'));
    tool.add(Tools1('Meetings', 'Last used 5 hours ago'));
    tool.add(Tools1('O-Grid', 'Last used 5 days ago'));
    tool.add(Tools1('Style', 'Last used 5 days ago'));

  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 20,
        ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                  padding: EdgeInsets.only(left: 20),
               child:Text('Tools',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)),
               ),
               Padding(
                 padding: EdgeInsets.only(right: 20),
               child: CircleAvatar(
                 maxRadius: 25,
                 backgroundImage: AssetImage('assets/ekta2.jpg'),
               ),
               ),
             ],
           ),
        Expanded(
          //height: 500,
            child:  ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration( color: color[index],borderRadius: BorderRadius.circular(20),border: Border.all(color: color[index],width: 5,style: BorderStyle.solid),
                      boxShadow: [BoxShadow(color: color[index])]),
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(10),
                  child:  ListTile(
                    minVerticalPadding: 10,
                    title: Text('${tool[index].title}',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w900)),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text('${tool[index].subtitle}',style: TextStyle(color: Colors.white70,fontSize: 15)),
                    ),
                    //leading: Icon(Icons[index]),
                    trailing: Icon(icon.elementAt(index),size: 80,color: Colors.white54),
                    //tileColor: color[index],
                  ),
                );
              },
              itemCount: tool.length,
            ),
        ),
      ],
    );
  }
}

