import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../imageadd/DBhelper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }
  File ? _file1;
  final _imagepicker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickerImage = await _imagepicker.pickImage(source: ImageSource.gallery);
    if(pickerImage != null){
      setState(() {
        _file1 = File(pickerImage.path);
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _priceController.text = existingJournal['price'];
      _descriptionController.text = existingJournal['description'];
      _timeController.text = existingJournal['time'];
      _descController.text = existingJournal['desc'];
    }
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // this will prevent the soft keyboard from covering the text fields
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Product'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(hintText: 'Price'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(hintText: 'Person'),
              ),
              TextField(
                controller: _timeController,
                decoration: const InputDecoration(hintText: 'Time'),
              ),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }
                      // Clear the text fields
                      _titleController.text = '';
                      _priceController.text = '';
                      _descriptionController.text = '';
                      _timeController.text = '';
                      _descController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _openImagePicker();
                      }, child: Icon(Icons.camera_alt)),
                ],
              )
            ],
          ),
        ));
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text,_priceController.text,_descriptionController.text,_timeController.text,_descController.text,_file1!.path);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text,_priceController.text,_descriptionController.text,_timeController.text,_descController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorable Profile',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.pink.shade100,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ekta Lakhani',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              accountEmail: Text('ektalakhani26@gmai.com',style: TextStyle(fontWeight: FontWeight.bold)),
              decoration:BoxDecoration(
                  gradient: LinearGradient(colors:
                  [Colors.red,Colors.green,Colors.deepPurpleAccent,Colors.blueAccent,Colors.yellowAccent,Colors.cyan,Colors.lightGreen,Colors.pink,Colors.purpleAccent])),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/ekta.jpeg'),
              ),
              onDetailsPressed: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.move_to_inbox,color: Colors.red,size: 30),
              title: Text('Inbox'),
            ),
            ListTile(
              leading: Icon(Icons.star,size: 30),
              title: Text('Starred'),
            ),
            ListTile(
              leading: Icon(Icons.send,size: 30),
              title: Text('Sent mail'),
            ),
            ListTile(
              leading: Icon(Icons.drafts,size: 30),
              title: Text('Drafts'),
            ),
            Container(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(Icons.mail,size: 30),
              title: Text('All mail'),
            ),
            ListTile(
              leading: Icon(Icons.delete,size: 30),
              title: Text('Trash'),
            ),
            ListTile(
              leading: Icon(Icons.sim_card_alert_outlined,size: 30),
              title: Text('Spam'),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
             child: CircularProgressIndicator(),
          )
          : ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context, index) => Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: size.width*0.4-10,
                        height: size.height/6,
                        child: _journals[index]['imagetype'] == "File" ?
                        Image.file(File(_journals[index]['fileimage']),fit: BoxFit.cover,):
                        Text('please enter the image'),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Product : ${_journals[index]['title']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width/25)),
                          SizedBox(height: 5,),
                          Text('Price : ${_journals[index]['price']}',style: TextStyle(fontSize: size.width/25)),
                          SizedBox(height: 5,),
                          Text('${_journals[index]['description']}',style: TextStyle(fontSize: size.width/25,fontWeight: FontWeight.w500)),
                          SizedBox(height: 5,),

                          Row(
                            children: [
                              Text('${_journals[index]['time']}',style: TextStyle(fontSize: size.width/25)),
                              Icon(Icons.star,color: Colors.yellow.shade700,size: size.width/25),
                              Icon(Icons.star,color: Colors.yellow.shade700,size: size.width/25),
                              Icon(Icons.star,color: Colors.yellow.shade700,size: size.width/25),
                              Icon(Icons.star_half_outlined,color: Colors.yellow.shade700,size: size.width/25),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text('${_journals[index]['desc']}',style: TextStyle(fontSize: size.width/25)),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showForm(_journals[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _deleteItem(_journals[index]['id']),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade100,
        child: const Icon(Icons.add,color: Colors.black),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
