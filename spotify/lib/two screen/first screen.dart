// import 'package:flutter/material.dart';
// import 'package:spotify/two%20screen/second%20screen.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: FirstScreen(),
//     );
//   }
// }
//
//
// class FirstScreen extends StatefulWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   TextEditingController name = TextEditingController();
//   var a = "Sangeeta";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             controller: name,
//             decoration: InputDecoration(hintText: 'enter value',border: OutlineInputBorder()),
//           ),
//           ElevatedButton(onPressed: () {
//
//             Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(name : name.text),));
//           }, child: Text('submit')),
//
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController name = TextEditingController();
  int routeCount = 0; // Add this variable to track the count\
  var a="riddhi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              hintText: 'enter value',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              routeCount++;
              if(routeCount == 6){
                Text('${a}');
                print('updated name: ${a}');
              }// Increment the count each time the button is pressed
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(
                    name: name.text,
                    routeCount: routeCount, // Pass the count to the second screen
                  ),
                ),
              );

              // Check if result is not null and update the UI with the result

              if (result != null) {
                setState(() {
                  name.text = result;
                });
              }
            },
            child: Text('submit'),
          ),
        ],
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  final String name;
  final int routeCount; // Add this variable to receive the count

  SecondScreen({Key? key, required this.name, required this.routeCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Navigator.pop to automatically update the first screen
    //Navigator.pop(context, 'Updated Name: $name');

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name is: $name'),
            Text('Route Count: $routeCount'), // Display the count
          ],
        ),
      ),
    );
  }
}

// class SecondScreen extends StatefulWidget {
//   final String name;
//
//   SecondScreen({Key? key, required this.name}) : super(key: key);
//
//   @override
//   State<SecondScreen> createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // Update the first screen without requiring a button click
//     // WidgetsBinding.instance!.addPostFrameCallback((_) {
//     //   Navigator.pop(context, 'Updated Name: ${widget.name}');
//     // });
//    // Navigator.pop(context, 'Updated Name: ${widget.name}');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Name is: ${widget.name}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
