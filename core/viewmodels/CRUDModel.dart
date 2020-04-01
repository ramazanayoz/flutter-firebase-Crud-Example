
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../models/productModel.dart';
import '../services/api.dart';

class XCrudModel extends ChangeNotifier {
  XApi _api = xlocator<XApi>();


  List<XProduct> products;

  Future<List<XProduct>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
      .map((doc) =>XProduct.fromMap(doc.data, doc.documentID))
      .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductAsStream(){
    return _api.streamDataCollection();
  }

  Future<XProduct> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return XProduct.fromMap(doc.data, doc.documentID);
  }

  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }  

  Future updateProduct(XProduct data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    print("--------CRUDModel class ----- updateProduct fonk: data.toJson() ${data.toJson()} İD: ${id}");
    return;
  }

  Future addProduct(XProduct data) async {
    var result = await _api.addDocument(data.toJson()); // json formate çevriliyor firebase yazdırmak için //çıktısı {price: 22, name: ayakkab, img: shoes}
    print("--------CRUDModel class ----- addProduct fonk: data ${data}");
    print("--------CRUDModel class ----- addProduct fonk: data.toJson() ${data.toJson()}"); 
    return; 
  }

}