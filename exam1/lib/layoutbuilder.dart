import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Material App Bar'),
        // ),
        body:Column(
          children: [
                 Container(
                  width: 350,
                  height: 300,
                  child:Expanded(
                  child:LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        height: 300,
                        width: 300,
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: Text(
                          'screen height : ${MediaQuery.of(context).size.height}\n'
                              'Container max width : ${constraints.maxWidth}\n'
                              'Container min width : ${constraints.minWidth}\n'
                              'Container max height : ${constraints.maxHeight}\n'
                              'Container min height : ${constraints.minHeight}',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },

                ),),),

            SizedBox(height: 20,),
                  Container(
                  width: 350,
                  height: 400,
                  child:Expanded(
                  child:LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: 300,
                        height: 300,
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: Text(
                          'screen height : ${MediaQuery.of(context).size.height}\n'
                              'Container max width : ${constraints.maxWidth}\n'
                              'Container min width : ${constraints.minWidth}\n'
                              'Container max height : ${constraints.maxHeight}\n'
                              'Container min height : ${constraints.minHeight}',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),),
                ),

          ],
        )

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     Expanded(
        //         child: LayoutBuilder(builder: (p0, p1) {
        //           return Container(
        //             color: Colors.pinkAccent,
        //             child: Text('screen height ${MediaQuery.of(context).size.height}\n '
        //                 'Container height ${p1.maxHeight}'),
        //           );
        //         },))
        //   ],
        // )
      ),
    );
  }
}
