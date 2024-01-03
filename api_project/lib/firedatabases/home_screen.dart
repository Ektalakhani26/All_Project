
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../firebase_app/login.dart';
import 'fire_service.dart'; // Replace with your actual import path

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FireStoreService _firestoreService = FireStoreService();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _numController = TextEditingController();
  String _documentId = "";

  // firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  // File? _photo = File('gs://api-project-3c3b6.appspot.com/women16.jpg');
  // final ImagePicker _picker = ImagePicker();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /*@override
  void initState() async {
    *//*final ref = FirebaseStorage.instance.ref().child('women16.jpg');
    // no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    print('MY IMAGE IS : $url');//
    super.initState();
  }*/

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => LoginScreen(),)); // Navigate back to the previous screen after sign-out
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  /*Future imgFromGallery() async {
    final ref = FirebaseStorage.instance.ref().child('testimage');
// no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    print(url);

    //final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (url != null) {
        _photo = File('gs://api-project-3c3b6.appspot.com/women16.jpg');
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
  }*/

 /* void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                       // imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                     // imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore CRUD Example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _signOut,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () {
            //    // _showPicker(context);
            //   },
            //   child: CircleAvatar(
            //     radius: 55,
            //     backgroundColor: Colors.black45,
            //     child: Image.network('api-project-3c3b6.appspot.com/women16.jpg'),
            //
            //
            //     /*_photo != null
            //         ? ClipRRect(
            //       borderRadius: BorderRadius.circular(50),
            //       child: Image.file(
            //         ,
            //         width: 100,
            //         height: 100,
            //         fit: BoxFit.fitHeight,
            //       ),
            //     )
            //         : Container(
            //       decoration: BoxDecoration(
            //           color: Colors.blue[200],
            //           borderRadius: BorderRadius.circular(50)),
            //       width: 100,
            //       height: 100,
            //       child: Icon(
            //         Icons.camera_alt,
            //         color: Colors.grey[800],
            //       ),
            //     ),*/
            //   ),
            // ),
            TextField(
              controller: _dataController,
              decoration: InputDecoration(labelText: 'Data'),
            ),
            TextField(
              controller: _numController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _firestoreService.createdata(
                      {'data': _dataController.text, 'num': _numController.text},
                      'your_collection_name',
                    );
                  },
                  child: Text('Create'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _firestoreService.updatedata(
                      {'data': _dataController.text, 'num': _numController.text},
                      'your_collection_name',
                      _documentId,
                    );
                  },
                  child: Text('Update'),
                ),
              ],
            ),
            StreamBuilder(
              stream: _firestoreService.readdata('your_collection_name'),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final docs = snapshot.data?.docs ?? [];

                return Column(
                  children: docs.map((document) {
                    final data = document.data() as Map<String, dynamic>;
                    final documentId = document.id;

                    // Check if 'data' and 'num' keys exist in the document
                    final dataValue = data['data'] ?? 'not available';
                    final numValue = data['num'] ?? 'not available';

                    return ListTile(
                      leading: Text(dataValue.toString()),
                      title: Text(numValue.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                _documentId = documentId;
                                _dataController.text = dataValue.toString();
                                _numController.text = numValue.toString();
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              await _firestoreService.deletedata(
                                'your_collection_name',
                                documentId,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}