import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/productModel.dart';
import '../../core/viewmodels/CRUDModel.dart';


class XAddProduct extends StatefulWidget {
  @override
  _XAddProductState createState() => _XAddProductState();
}

class _XAddProductState extends State<XAddProduct> {
  //var
  final _formKey = GlobalKey<FormState>();
  String productType = 'Bag'; //DEFAULT
  String title ;
  String price ;
  
  @override
  Widget build(BuildContext context) {
    print("--------addProduct class working---------");
    //Var
    var productProvider = Provider.of<XCrudModel>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Product'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Product Title',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Product Title'; }
                },
                onSaved: (value) => title = value,
              ),
              SizedBox(height:16,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Price',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter The price';}
                },
                onSaved: (value) => price = value
              ),
              DropdownButton<String>(//bu kısım menuden ürün tipi seçilen bölüm
                value: productType,
                onChanged: (String newValue) {
                  setState(() {
                    productType = newValue;
                  });
                },
                items: <String>['Bag', 'Computer', 'Dress', 'Phone','Shoes']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text("$value type"),
                    );
                  }).toList(),
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{    //ADD PRODUCT BASILDIĞINDA 
                  if (_formKey.currentState.validate()) { //kontrole uyuyorsa 
                    _formKey.currentState.save(); //formu kaydet
                    await productProvider.addProduct(XProduct(name: title,price: price,img: productType.toLowerCase())); //firebase ürünü kaydetme işlemi
                    Navigator.pop(context) ;  } //bu ekranı kapat 
                },
                child: Text('add Product', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),

            ],
          ),
        ),
      ),      
    );
  }
}