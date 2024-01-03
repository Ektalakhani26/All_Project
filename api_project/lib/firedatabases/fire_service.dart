import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> createdata(Map<String , dynamic> data,String collectionname) async{

    await _firestore.collection(collectionname).add(data);
  }

 Stream<QuerySnapshot> readdata(String collectionname){
    return _firestore.collection(collectionname).snapshots();
 }

  Future<void> updatedata(Map<String , dynamic> data,String collectionname , String docId) async{

    await _firestore.collection(collectionname).doc(docId).update(data);

  }

  Future<void> deletedata(String collectionname , String docId) async{

    await _firestore.collection(collectionname).doc(docId).delete();

  }

}