import 'package:flutter/material.dart';

import '../pageviewbulider/modelclass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: CustomList(),
      ),
    );
  }
}

class CustomList extends StatefulWidget {
  const CustomList({Key? key}) : super(key: key);

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  List<Person> listofperson=[];
String text='';
String text1 = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofperson.add(Person('ekta', 'last seen 8:00', 'assets/ekta2.jpg'));
    listofperson.add(Person('sangita', 'last seen 7:00', 'assets/sangita.jpg'));
    listofperson.add(Person('Kaushik', 'last seen 6:15', 'assets/kaushik.jpg'));
    listofperson.add(Person('Renil', 'last seen 3:14', 'assets/bedtime.jpg'));
    listofperson.add(Person('Priyank', 'last seen 3:14', 'assets/doller.jpg'));
    listofperson.add(Person('Hemaxi', 'last seen 3:14', 'assets/welcom.jpg'));
    listofperson.add(Person('Darsh', 'last seen 3:14', 'assets/pin1.jpg'));
    listofperson.add(Person('Mautry', 'last seen 3:14', 'assets/resgistration.png'));
    listofperson.add(Person('ekta', 'last seen 8:00', 'assets/ekta2.jpg'));
    listofperson.add(Person('sangita', 'last seen 7:00', 'assets/sangita.jpg'));
    listofperson.add(Person('Kaushik', 'last seen 6:15', 'assets/kaushik.jpg'));
    listofperson.add(Person('Renil', 'last seen 3:14', 'assets/bedtime.jpg'));
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CustomListView'),
          backgroundColor: Colors.purpleAccent,
          shadowColor: Colors.purple.shade900,
          //surfaceTintColor: Colors.green,
        ),
      body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
                  childCount: listofperson.length,
                  (context, index) {
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: AssetImage('${listofperson[index].img}'),),
                      title: Text('${listofperson[index].title}'),
                      subtitle: Text('${listofperson[index].subtitle}'),
                      trailing: PopupMenuButton(itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    listofperson.removeAt(index);
                                    Navigator.pop(context);
                                  });
                                },
                               // onLongPress: () { setState(() { _saved. remove(index); }); },
                                child: Text('Delete'),)),
                          PopupMenuItem(child: InkWell(
                          onTap: () async {
                            print(index);
                            Navigator.pop(context);
                              await  _showCustomDialog(context,index);

                          },child: Text('Edit'),
                          ),
                          ),
                        ];
                      },),
                    );

          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

       },child: PopupMenuButton(itemBuilder: (context) {
        return[
          PopupMenuItem(child: InkWell(
            onTap: () async {
              _CustomDialog(context);
            },
            child: Text('Edit'),
          ))
        ];
      },child: Icon(Icons.add)),
      ),
    );
  }

  Future <void> _showCustomDialog(BuildContext context, int index) async {
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController subtitlecontroller = TextEditingController();

    titlecontroller.text = listofperson[index].title;
    subtitlecontroller.text = listofperson[index].subtitle;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
                padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Menu',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                  onChanged: (value) {
                    setState(() {
                      text=value;
                    });

                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: subtitlecontroller,
                  decoration: InputDecoration(
                    hintText: 'SubTitle',
                  ),
                  onChanged: (value) {
                    setState(() {
                      text1 = value;
                    });

                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listofperson[index].title = text;
                          listofperson[index].subtitle = text1;
                          //listofperson[index].title = titlecontroller.text;
                         // listofperson[index].subtitle = subtitlecontroller.text;
                        });
                         //listofperson[index].title = titlecontroller.text;
                        // listofperson[index].subtitle = subtitlecontroller.text;
                        //listofperson[index].title;
                        //subtitlecontroller.text = listofperson[index].subtitle;
                        //print('${listofperson[index].title}');
                        Navigator.pop(context);
                      },
                      child: Text('Submit'),
                    ),
                  ],
                )
              ],
            ),
            ),
          );
        },);
  }


  void _CustomDialog(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController subtitle = TextEditingController();
  //title.text = listofperson[context].title;

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
                padding: EdgeInsets.all(10),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Text('Add The Data'),
                   SizedBox(height: 10,),
                   TextField(
                     controller: title,
                     decoration: InputDecoration(
                       hintText: 'enter the name',
                     ),
                   ),
                   SizedBox(height: 10,),
                   TextField(
                     controller: subtitle,
                     decoration: InputDecoration(
                       hintText: 'subtitle',
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                       }, child: Text('Cancel')),
                       SizedBox(width: 10,),
                       ElevatedButton(onPressed: () {
                         Navigator.pop(context);
                            setState(() {
                              listofperson.add(Person(title.text, subtitle.text, 'assets/ekta2.jpg'));
                            });

                         //listofperson.add(title.text as Person);
                       }, child: Text('Add')),
                     ],
                   ),
                 ],
               ),
            ),

          );
        },);

  }

  // Widget getWidget(int num) {
  //
  // }
}