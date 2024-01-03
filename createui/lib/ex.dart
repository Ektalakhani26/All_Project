import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCountryCode = '';
  String selectedCountryName = '';

  void _onCountryChange(CountryCode? code) {
    setState(() {
      selectedCountryCode = code!.code!;
      selectedCountryName = code.name!;
    });

    print("Selected country code: $selectedCountryCode");
    print("Selected country name: $selectedCountryName");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Country Code: $selectedCountryCode',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Selected Country Name: $selectedCountryName',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            CountryListPick(
              appBar: AppBar(
                title: Text('Select Country'),
              ),
              onChanged: _onCountryChange,
              initialSelection: 'US', // Initial selection (optional)
            ),
          ],
        ),
      ),
    );
  }
}