
import 'package:agriculture/data/models/cold-functions-result-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  CollectionReference collection =
  FirebaseFirestore.instance.collection('agriculture');


  static final FirestoreHelper _singleton = FirestoreHelper._internal();

  factory FirestoreHelper() {
    return _singleton;
  }

  FirestoreHelper._internal();

  Future<void> addToCollection(Map<String,dynamic> data,String docName) async {
    collection
        .doc(docName)
        .set(data)
        .onError((e, _) => print("Error writing document: $e"));
  }
}
