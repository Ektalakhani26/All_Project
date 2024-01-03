import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MobileAuth(),
    );
  }
}

class MobileAuth extends StatefulWidget {
  const MobileAuth({Key? key}) : super(key: key);

  @override
  State<MobileAuth> createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
  String _selectedCountryName = 'India'; // Default country name
  String _phoneNumber = ''; // Stores the entered phone number

  final Map<String, String> countryNames = {
    'IN': 'India',
    // Add more country codes and names here as needed.
  };

  @override
  void initState() {
    super.initState();
    // Set the initial values when the widget is first created.
    _selectedCountryName = countryNames['IN'] ?? 'India'; // Default to India
    _phoneNumber = ''; // Leave phone number empty initially
  }

  @override
  Widget build(BuildContext context) {

    print('contry name:${_selectedCountryName}');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text('Enter phone number', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                // Update the displayed country name and phone number when the country code changes.
                setState(() {
                  _selectedCountryName = countryNames[phone.countryCode] ?? 'Unknown';
                  print('contry name:${_selectedCountryName}');
                  _phoneNumber = phone.completeNumber ?? '';
                });
              },
            ),
            SizedBox(height: 20),
            // Display the selected country name and phone number.
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Selected Country: $_selectedCountryName'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Phone Number: $_phoneNumber'),
            ),
          ],
        ),
      ),
    );
  }
}
