import 'package:cloud_firestore/cloud_firestore.dart';

class XApi{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;


  XApi(this.path){
    ref = _db.collection(path);
    //print("------api Class ----- path: $path");
  }

  Future<QuerySnapshot> getDataCollection(){
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection(){
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<void> removeDocument(String id){
    // print("------removeDocument ----- id: $id");
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data){
    print("------addDocument ----- data: $data");
    return ref.add(data); 
  }

  Future<void> updateDocument(Map data, String id,){
    return ref.document(id).updateData(data);
  }
  
}