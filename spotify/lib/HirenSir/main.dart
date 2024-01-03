import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counterClass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider',
      /*home: Provider(
        create: (context) => Counter(),
        child: CounterPage(),
      ),*/
      home: ChangeNotifierProvider(
        create: (context) => CounterClass(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    print('build method called');

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterClass>(context, listen: false).minusH();
                  },
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  '${Provider.of<CounterClass>(context).counter}',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterClass>(context, listen: false).PluseH();
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}