import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'jsontodart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ApiExample> postmodel = [];

  Future<List<ApiExample>> getPostApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postmodel.clear();
      for(Map i in data){
        postmodel.add(ApiExample.fromJson(i));
      }
      return postmodel;
    }
    else{
      return postmodel;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10,),
            Text('User Data',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35) ),
            SizedBox(height: 10,),
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Text('Loding');
                  }
                  else{
                    return ListView.builder(
                      itemCount: postmodel.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('id : ${postmodel[index].id.toString()}',style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Userid : ${postmodel[index].userId.toString()}',style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Title : ${postmodel[index].title.toString()}'),
                              Text('Description : ${postmodel[index].body.toString()}'),
                            ],
                        ),
                          ),);
                    },);
                  }
              },),
            )
          ],
        ),
      ),
    );
  }
}
