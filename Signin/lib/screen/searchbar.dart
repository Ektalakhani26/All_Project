import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children :[
                  Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.black,
                    child: Image(image: AssetImage('assets/leave1.jpg'),fit: BoxFit.fill,),
                  ),
                  Container(
                    height: size.height/5,
                    width: size.width,
                    child: Image(image: AssetImage('assets/searchback.jpg'),fit: BoxFit.fill,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: AnimatedSearchBar(
                      label: "Enter Search Here",
                      labelAlignment: Alignment.center,
                      onChanged: (value) {
                        print("value on Change");
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      searchText,
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
