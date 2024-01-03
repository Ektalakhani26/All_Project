// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
//   final List<String> names = [
//     'Liam', 'Noah', 'Oliver', 'William', 'Elijah',
//     'James', 'Benjamin', 'Lucas', 'Mason', 'Ethan', 'Alexander'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldkey,
//       appBar: AppBar(
//         title: Text('Pop Menu with List'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (_, i) {
//           String name = names[i];
//           return ListTile(
//             title: Text('$name'),
//             trailing: PopupMenuButton(
//               icon: Icon(Icons.more_vert),
//               itemBuilder: (context) {
//                 return [
//                   PopupMenuItem(
//                     value: 'edit',
//                     child: Text('Edit'),
//                   ),
//                   PopupMenuItem(
//                     value: 'delete',
//                     child: Text('Delete'),
//                   )
//                 ];
//               },
//               onSelected: (String value) => actionPopUpItemSelected(value, name),
//             ),
//           );
//         },
//         itemCount: names.length,
//       ),
//     );
//   }
//
//   void actionPopUpItemSelected(String value, String name) {
//     //_scaffoldkey.currentState.hideCurrentSnackBar();
//     String message;
//     if (value == 'edit') {
//
//       message = 'You selected edit for $name';
//     } else if (value == 'delete') {
//       print('delete');
//       names.removeAt;
//       print('You selected delete for $name');
//     } else {
//       message = 'Not implemented';
//     }
//     //final snackBar = SnackBar(content: Text(message));
//     //_scaffoldkey.currentState.showSnackBar(snackBar);
//   }
// }

import 'package:flutter/material.dart';

import '../pageviewbulider/modelclass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<String> listofimage=[
  //   "assets/ekta.jpg",
  //   "assets/aesop.jpg",
  //   "assets/bedtime.jpg",
  //   "assets/doller.jpg",
  //   "assets/user1.jpg",
  //   "assets/login.jpg",
  //   "assets/panch.jpg",
  //   "assets/pin1.jpg",
  // ];
  List<Person> listofperson = [];

  _onSelected(dynamic val) {
    setState(() => listofperson.removeWhere((data) => data == val));
  }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofperson.add(Person('ekta', 'last seen 8:00', 'assets/ekta2.jpg'));
    listofperson.add(Person('sangita', 'last seen 7:00', 'assets/aesop.jpg'));
    listofperson.add(Person('Kaushik', 'last seen 6:15', 'assets/panch.jpg'));
    listofperson.add(Person('Renil', 'last seen 3:14', 'assets/bedtime.jpg'));
    listofperson.add(Person('Priyank', 'last seen 3:14', 'assets/doller.jpg'));
    listofperson.add(Person('Hemaxi', 'last seen 3:14', 'assets/welcom.jpg'));
    listofperson.add(Person('Darsh', 'last seen 3:14', 'assets/pin1.jpg'));
    listofperson.add(Person('Mautry', 'last seen 3:14', 'assets/resgistration.png'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text("ListView with Edit or Delete"),
      ),
      body: ListView(
        children: listofperson
            .map((data) => ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage('${data.img}')),
          title: Text('${data.title}'),
          subtitle: Text('${data.subtitle}'),
          trailing: PopupMenuButton(
            onSelected: _onSelected,
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: data,
                child: Text("Delete"),
              ),
              PopupMenuItem(
                child: Text('Edit'),),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }
}