import 'package:flutter/material.dart';
List<Map> data1 = [
  {
    // 'title1': 'Topic:',
    'title': 'ListVeiw ',
    'date': '11/01/2022',
    'time': ' 10:00 AM to 11:00 AM ',
    'link':'https://us02web.zoom.us/j/2415265577?pwd=V29XNHZlQ2l5UndoN2ljZmlWZlVQZz09#success',
  },
  {
    // 'title1': 'Topic:',
    'title': 'Gridveiw Example',
    'date': '23/01/2022',
    'time': ' 10:00 AM to 11:00 AM ',
    'link':'https://us02web.zoom.us/j/2415265577?pwd=V29XNHZlQ2l5UndoN2ljZmlWZlVQZz09#success',

  },
  {
    //  'title1': 'Topic:',
    'title': 'on Paper design',
    'date': '01/02/2022',
    'time': ' 10:00 AM to 11:00 AM ',
    'link':'https://us02web.zoom.us/j/2415265577?pwd=V29XNHZlQ2l5UndoN2ljZmlWZlVQZz09#success',
  },
];
List<Map> data = [
  {
    'icondata': Icons.notifications,
    'title': 'paytm postpaid',
    'detail': 'hbgjhjklklhgghdfgcvhjhnklnjvfyhguj'
  },
  {
    'icondata': Icons.notifications,
    'title': 'paytm ',
    'detail': 'hbgjhjklklhgghdfgyhguj'
  },
  {
    'icondata': Icons.notifications,
    'title': 'postpaid',
    'detail': 'vfyhguj',
  },
  {
    'icondata': Icons.notifications,
    'title': 'pytmstpaid',
    'detail': 'holiday all day',
  },
  {
    'icondata': Icons.notifications,
    'title': 'stpaid',
    'detail': 'come fast'
  },
];
class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);
  @override
  _Tab1State createState() => _Tab1State();
}
class _Tab1State extends State<Tab1> {
  Widget commonContainer(context,index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 9,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.black12, width: 2)),

        shadowColor:  Color(0xff03508C),
        child: Container(
          height: MediaQuery.of(context).size.height/4.5,
          width:  MediaQuery.of(context).size.width/3,
          /* decoration: BoxDecoration(
              boxShadow: [
              BoxShadow(
              color: Color(0xff03508C).withOpacity(0.5), //color of shadow
          spreadRadius: 2, //spread radius
          blurRadius: 3, // blur radius
          offset: Offset(3, 3), // changes position of shadow
          //first paramerter of offset is left-right
          //second parameter is top to down
        ),
        ]
      ),*/
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(data1[index]['title'], style: TextStyle(color: Colors.black, fontSize: 18),),
                  trailing: Text(data1[index]['date'],style: TextStyle(color: Colors.black, fontSize: 18),),
                  //subtitle: Text(data1[index]['detail'],style: TextStyle(color: Colors.grey, fontSize: 12,),),
                ),
                Center(child: Text(data1[index]['link'],style: TextStyle(color: Colors.grey, fontSize: 13),)),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    data1[index]['time'],
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ), SizedBox(height: 17),

              ],

            ),
          ),
        ),
      ),
    );
  }
  Widget commonContainer1(context, Map data, Color clr) {
    //bool ab = true;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // print(data.length);
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                //   Text(data['title']),
                Text(data['detail']),
              ],
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              color: clr,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff03508C).withOpacity(0.6), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 3, // blur radius
                  offset: Offset(3, 3), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
              ],
            ),
            // print(data.length.isOdd);
            child: Center(
              child: ListTile(
                leading: Icon(
                  data['icondata'],
                  size: 25,
                  color: Color(0xff03508C),
                ),
                title: Text(
                  data['title'],
                  style: TextStyle(color: Color(0xff03508C),fontWeight: FontWeight.w500,fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xff03508C),
          leading:IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.white)),
          title: const Text(
            "Exam & Result",style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Exam',),
              Tab(text: 'Result',),
              // Tab(text: 'Calls',),
              //Tab(text: 'Settings',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
                  return commonContainer(context,index);
                }),
            ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return commonContainer1(context, data[index], Colors.white);
                  //  index.isOdd ? Color(0xffF36F24) : Color(0xffF03508c));
                }),
            // Center(child: Text('Exam Page'),),
            // Center(child: Text('Result Page'),),
            //   Center(child: Text('Calls Page'),),
            //  Center(child: Text('Settings Page'),)
          ],
        ),
      ),
    );
  }
}