import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../core/models/productModel.dart';
import '../../core/viewmodels/CRUDModel.dart';
import '../../ui/widgets/productCard.dart';


class XHomeView extends StatefulWidget {
  @override
  _XHomeViewState createState() => _XHomeViewState();
  
}

class _XHomeViewState extends State<XHomeView> {
  
  //varieables
  List<XProduct> _products;

  @override
  Widget build(BuildContext context) {
    print("------------homeViewClass working-------");
    final productProvider = Provider.of<XCrudModel>(context);
    return Scaffold( 
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/addProduct');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Home'),)
      ),
      body: Container(
        
        child: StreamBuilder(   /////
          stream: productProvider.fetchProductAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){  ///firebase deki elemanlar _product listesine ekleniyor --------- ve daima realtime güncellik sağlanıyor
            if (snapshot.hasData){
              _products = snapshot.data.documents ///BU KISIM ÇOK ÖNEMLİ --------------------------------
                .map((doc) => XProduct.fromMap(doc.data, doc.documentID),)
                .toList();

              print("not: homewView: Streambuilder _products.length : ${_products.length}");
              _products.forEach((element) => print(" element.name: ${element.name}"));

              return ListView.builder(         //Bu kısım önemli productcARD KISMI     
                itemCount: _products.length,
                itemBuilder: (buildContext, index) => 
                  XProductCard(xproduct: _products[index]),
              );
            } else { 
              return Text('fetching');
            }
          }
          ),
      ),
    );
  }
}