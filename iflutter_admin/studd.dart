import 'package:flutter/material.dart';

Widget commonContainer(Map data) {
  return Container(
    height: 20,
    width: 100,
    color: Colors.black54,
    child: Text('aa'),
  );
}

class studd extends StatefulWidget {
  const studd({Key? key}) : super(key: key);

  @override
  _studdState createState() => _studdState();
}

class _studdState extends State<studd> {
  List<Map> data = [
    {'title': 'Attendance', 'ic': Icons.arrow_forward_ios},
    {'title': 'Attendance', 'ic': Icons.arrow_forward_ios},
    {'title': 'Attendance', 'ic': Icons.arrow_forward_ios},
    {'title': 'Attendance', 'ic': Icons.arrow_forward_ios},
    {'title': 'Attendance', 'ic': Icons.arrow_forward_ios},
    {'title': 'Attendance', 'ic': Icons.arrow_forward_ios}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return commonContainer(data[index]);
          }),
    );
  }
}
