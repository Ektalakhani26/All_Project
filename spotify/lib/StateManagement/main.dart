import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/StateManagement/StateProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (context) => ClassProvider1(),
        child: HomePage1(),
      ),
    );
  }
}

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    print("Widget build");
    return Scaffold(
      appBar: AppBar(title: Text('Statement1')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Provider.of<ClassProvider1>(context, listen: false).Pluse();
              },
              child: Text('+')),
          Text(
              '${Provider.of<ClassProvider1>(context, listen: false).counter}'),
          // Consumer<ClassProvider1>(
          //   builder: (context, counter, child) {
          //     return Text('${counter.counter}');
          //   },
          // ),
          ElevatedButton(
              onPressed: () {
                Provider.of<ClassProvider1>(context, listen: false).minus();
              },
              child: Text('-')),
        ],
      ),
    );
  }
}
