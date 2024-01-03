import 'package:flutter/material.dart';

enum sampleItem {itemone ,itemtwo ,itemthree}
class PopupMenu extends StatefulWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Menu'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: Text('my account'),
              value: 0,
              ),
              PopupMenuItem(
                child: Text('Setting'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('Log out'),
                value: 2,
              ),
            ];
          },
            onSelected: (value) {
              if(value==0){
                print('my account selected');
              }
              else if(value==1){
                print('setting menu seleted');
              }
              else if(value==2){
                print('Logout menu seleted');
              }
            },
          ),
          ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
            _showdate(context);
        }, child:  Text('date picker')),
      ),
    );
  }

}

Future<void> _showdate(BuildContext context) async {
   var date = await showDatePicker(
       context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(2000),
       lastDate: DateTime(2026),
     helpText: 'select booking date',
     cancelText: 'Not Now',
     confirmText: 'Select date',
     errorFormatText: 'enter valid date',
     errorInvalidText: 'enter date in valid range',
     fieldHintText: 'Month/Year/Date',
     fieldLabelText: 'select date',
     selectableDayPredicate: _dialog,
   );
}

bool _dialog(DateTime day) {

  if((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
  day.isBefore(DateTime.now().add(Duration(days: 0))))){
    return true;
  }

  return false;
}
