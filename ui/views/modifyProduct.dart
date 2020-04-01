import 'package:eventor/denem8-firestore-crud/core/viewmodels/CRUDModel.dart';
import 'package:provider/provider.dart';

import '../../core/models/productModel.dart';
import 'package:flutter/material.dart';

class XModifyProduct extends StatefulWidget {
  final XProduct xproduct;

  XModifyProduct({@required this.xproduct});

  @override
  _XModifyProductState createState() => _XModifyProductState();
}

class _XModifyProductState extends State<XModifyProduct> {
  final _formKey = GlobalKey<FormState>();

  String productType ;

  String title ;

  String price ;

  @override
  Future<void> initState() {
    // TODO: implement initState
    productType =  widget.xproduct.img[0].toUpperCase() + widget.xproduct.img.substring(1);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<XCrudModel>(context);
    print("-------modifyProduct class working-----");
    print("not: productType $productType");
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Modify Product Details'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.xproduct.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Product Title',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Product Title';
                    }
                  },
                  onSaved: (value) => title = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.xproduct.price,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
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
                      child: Text(value),
                    );
                  }).toList(),
              ),
              RaisedButton( //MODİFY PRODUCT BASILDIĞINDA 
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {//kontrole uyuyorsa 
                    _formKey.currentState.save();//fORMU KAYDET
                    await productProvider.updateProduct(XProduct(name: title,price: price,img: productType.toLowerCase()),widget.xproduct.id);
                    Navigator.pop(context) ;  //FİREBASE UPDATE İŞLEMİ 
                  }
                },
                child: Text('Modify Product', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}