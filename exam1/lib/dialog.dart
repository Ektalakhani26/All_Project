import 'package:exam1/popupmenu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.purple.shade200,
          dayPeriodBorderSide: BorderSide(color: Colors.black, width: 3),
          dialBackgroundColor: Colors.white54,
          dialHandColor: Colors.pink,
          entryModeIconColor: Colors.red,
          hourMinuteColor: Colors.purple,
          hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? Colors.green
              : Colors.yellow),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            iconColor: Colors.yellow,
            activeIndicatorBorder: BorderSide(color: Colors.yellow, width: 5),
            focusColor: Colors.deepOrange,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Alert Dialog',
      home: DialogExample(),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dialog'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  textStyle: TextStyle(color: Colors.blue),
                  value: 0,
                  enabled: true,
                  labelTextStyle:
                      MaterialStatePropertyAll(TextStyle(color: Colors.pink)),
                  child: Text('new group'),
                ),
                PopupMenuItem(
                  textStyle: TextStyle(color: Colors.blue),
                  value: 0,
                  enabled: true,
                  labelTextStyle:
                      MaterialStatePropertyAll(TextStyle(color: Colors.pink)),
                  child: Text('new broadcast'),
                ),
                PopupMenuItem(
                  textStyle: TextStyle(color: Colors.blue),
                  value: 0,
                  enabled: true,
                  labelTextStyle:
                      MaterialStatePropertyAll(TextStyle(color: Colors.pink)),
                  child: Text('Linked device'),
                ),
                PopupMenuItem(
                  textStyle: TextStyle(color: Colors.blue),
                  value: 0,
                  enabled: true,
                  labelTextStyle:
                      MaterialStatePropertyAll(TextStyle(color: Colors.pink)),
                  child: Text('Starred messages'),
                ),
                PopupMenuItem(
                  textStyle: TextStyle(color: Colors.blue),
                  value: 0,
                  enabled: true,
                  labelTextStyle:
                      MaterialStatePropertyAll(TextStyle(color: Colors.pink)),
                  child: Text('Payments'),
                ),
                PopupMenuItem(
                  textStyle: TextStyle(color: Colors.blue),
                  value: 0,
                  enabled: true,
                  labelTextStyle:
                      MaterialStatePropertyAll(TextStyle(color: Colors.pink)),
                  child: Text('Setting'),
                ),
              ];
            },
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1, color: Colors.pink)),
            // color: Colors.grey,
            //clipBehavior: Clip.antiAliasWithSaveLayer,
            //icon: Icon(Icons.add),
            shadowColor: Colors.purpleAccent,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PopupMenu(),
                      ));
                },
                child: Text('Popup menu')),
            ElevatedButton(
              onPressed: () async {
                var color = await _showSimpleDialog(context);
                print(color);
                //var result = await _showSimpleDialogBackup(context);
              },
              child: Text('Simple Dialog'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                var action = await _showAlertDialog(context);
                print(action);
              },
              child: Text('Alert Dialog'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                _showCustomDialog(context);
              },
              child: Text('Custom Dialog'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                _showDatePickerDialog(context);
              },
              child: Text('Date Picker Dialog'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                _showSimpleDialogBackup(context);
              },
              child: Text('simple dialog backup'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                _showTimePickerDialog(context);
              },
              child: Text('Time Picker Dialog'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _showSimpleDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select Color'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, "Red");
              },
              child: Text('Red'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, "Black");
              },
              child: Text('Black'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, "White");
              },
              child: Text('White'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, "Green");
              },
              child: Text('Green'),
            )
          ],
        );
      },
    );
  }

  Future<String> _showAlertDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content:
              Text('are you sure you want to logout from this application?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "logout");
              },
              child: Text('Logout'),
            )
          ],
        );
      },
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.amber.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Custom Dialog',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter email address',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pop(context , "cancel");
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pop(context , "submit");
                      },
                      child: Text('Submit'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDatePickerDialog(BuildContext context) async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select booking date',
      // Can be used as title
      cancelText: 'Not now',
      confirmText: 'Book',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Booking date',
      fieldHintText: 'Month/Date/Year',
    );

    print(selectedDate);
  }

  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 10))) &&
        day.isBefore(DateTime.now().add(Duration(days: 0))))) {
      return true;
    }
    return false;
  }

  Future<String> _showSimpleDialogBackup(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select Language'),
          children: [
            SimpleDialogOption(
              child: Text('Java'),
              onPressed: () {
                Navigator.pop(context, 'Java');
              },
            ),
            SimpleDialogOption(
              child: Text('Dart'),
              onPressed: () {
                Navigator.pop(context, 'Dart');
              },
            ),
            SimpleDialogOption(
              child: Text('Kotlin'),
              onPressed: () {
                Navigator.pop(context, 'Kotlin');
              },
            )
          ],
        );
      },
    );
  }
}

Future<void> _showTimePickerDialog(BuildContext context) async {
  var selecttime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    confirmText: 'book',
    cancelText: 'Not Now',
    helpText: 'select booking time',
    errorInvalidText: 'valid time',
    anchorPoint: Offset.zero,
    hourLabelText: 'select Houre',
    minuteLabelText: 'select minute',
    onEntryModeChanged: (p0) {
      print('aaaaaaaaaa');
    },
    /* builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            // primary: MyColors.primary,
            primary: Theme.of(context).colorScheme.primary,
            onPrimary: Colors.red,
            surface: Colors.green,
            onSurface: Colors.white,
            secondary: Colors.white,
            onSecondary: Colors.yellow,
            onBackground: Colors.blue,
            
          ),
          //.dialogBackgroundColor:Colors.blue[900],
        ),
        child: child!,
      );
    },
   */
    // builder: (context, child) {
    //   return Container(
    //     color: Colors.deepOrange,
    //   );
    // },
    routeSettings: RouteSettings(name: 'abc', arguments: 'xyz'),
  );
  print(selecttime);
}
