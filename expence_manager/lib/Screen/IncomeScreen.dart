
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/db_helper.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {

  List<Map<String, dynamic>> _journals = [];
  final List<String> items = [
    'Salary',
    'selling',
    'recharge',
    'Item4',
    'other',

  ];
  String? selectedValue;
  TextEditingController _amount = TextEditingController();
  TextEditingController _category = TextEditingController();
  bool showAdditionalTextField = false;

  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _amount.text = existingJournal['amount'];
      _category.text = existingJournal['category'];
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _amount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Amount', style: TextStyle(fontSize: 20)),
                      hintText: '| enter your amount',
                      prefixIcon: Icon(Icons.currency_rupee, size: 20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _category,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Choose Category',
                      suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(double.maxFinite,double.infinity))),
                  onPressed: () async {
                    // Save new journal
                    if (id == null) {
                      await _addItem();
                    }

                    if (id != null) {
                      await _updateItem(id);
                    }
                    // Clear the text fields
                    _amount.text = '';
                    _category.text = '';

                    // Close the bottom sheet
                    Navigator.of(context).pop();
                  },
                  child: Text('Update'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(id, _amount.text, _category.text);
    _refreshJournals();
  }

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  @override
  void initState() {
    _refreshJournals();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _addItem() async {
    if (_amount.text.isEmpty || selectedValue == null || _selectedDate == null) {
      // Show an error message or dialog indicating missing fields
      return;
    }

    if (selectedValue == "other" && _category.text.isEmpty) {
      // Show an error message or dialog indicating missing category
      return;
    }
    await SQLHelper.createamount(
        _amount.text, selectedValue == "other" ? _category.text : selectedValue!, _selectedDate!.millisecondsSinceEpoch);
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }
  DateTime ? _selectedDate = DateTime.now();
  // DateTime? _selectedDate;
  Future<void> _show(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      // selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select booking date',
      // Can be used as title
      cancelText: 'Not now',
      confirmText: 'Book',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Booking date',
      fieldHintText: 'Month/Date/Year',
    );
    if (selectedDate != null) {
      // Rebuild the UI
      //print(result.start.toString());
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }
   Field(){
    return TextField(
      decoration: InputDecoration(
        hintText: 'enter value'
      ),
    );
  }
  final f = DateFormat('dd-MM-yyyy');
  String formatAmount(int amount) {
    final formatter = NumberFormat('#,##,###');
    return formatter.format(amount);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ab = _amount.text;
    print('income ${ab}');
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('IN entry of ₹ $ab',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _amount,
                  validator: (value) {
                    value = _amount.text;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Amount',style: TextStyle(fontSize: 20)),
                    hintText: '| enter your amount',
                    prefixIcon: Icon(Icons.currency_rupee,size: 20),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        if (value == "other") {
                          // Show the additional TextField
                          showAdditionalTextField = true;
                          selectedValue = value;
                        //  value = _category.text;
                         // selectedValue = _category.text;
                        } else {
                          // Hide the additional TextField
                          showAdditionalTextField = false;
                          selectedValue = value;
                        }
                      });

                    },
                    buttonStyleData: ButtonStyleData(
                      height: size.height/15,
                      width: size.width,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: size.width/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                     // offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
              if (showAdditionalTextField)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _category,
                    decoration: InputDecoration(
                      hintText: 'Enter Other Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: size.height/17,
                      width: size.width/3+20,
                      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent.shade400)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              _show(context);
                            },
                            child: Icon(Icons.calendar_month,size: 30,color: Colors.red.shade800),
                          ),
                          Text("${_selectedDate == null ? f.format(DateTime.now()) : _selectedDate?.toString().split(' ')[0]}",style: TextStyle(color: Colors.red.shade800,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _journals.length,
                  itemBuilder: (context, index) {
                    final f = DateFormat('dd-MM-yyyy');
                    //DateTime now = DateTime.fromMillisecondsSinceEpoch(_journals[index]['expencedate']);
                    // String formattedDate = DateFormat.yMd();
                    // print(formattedDate);
                    // var dateTime = DateTime.fromMillisecondsSinceEpoch(_journals[index]['expencedate']).toString();
                    // var formate1 = "${TimeOfDay.fromDateTime(DateTime.parse(_journals[index]['expencedate']))}";
                    return Card(
                      child: ListTile(
                        //leading: Text(_journals[index]['date']),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(f.format(DateTime.fromMillisecondsSinceEpoch(_journals[index]['date'])),style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(_journals[index]['category'],style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(formatAmount(int.parse(_journals[index]['amount'])),style: TextStyle(fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                _showForm(_journals[index]['id']);
                              },
                              child: Icon(Icons.edit,color: Colors.green.shade700),
                            ),
                            InkWell(
                                onTap: () {
                                  _deleteItem(_journals[index]['id']);
                                },
                                child: Icon(Icons.delete,color: Colors.red.shade700,)),
                          ],
                        ),
                        // trailing: Icon(Icons.edit),
                      ),
                    );
                  },
                ),
              ),
              // Spacer(flex: 9,),
              Container(
                margin: EdgeInsets.only(left: size.width*0.1-20,right: size.width*0.1-20),
                child: ElevatedButton(
                    onPressed: () async {

                      await _addItem();
                      setState(() {

                      });
                      _amount.text = '';
                      _category.text = '';
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(journals1: _journals)));
                    }, child: Text('SAVE',style: TextStyle(fontSize: 25)),style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, double.minPositive)),backgroundColor: MaterialStatePropertyAll(Colors.green.shade700))),
              ),
              //Spacer(),
            ],
          )
      ),
    );
  }
}