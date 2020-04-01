import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../core/models/productModel.dart';
import '../../core/viewmodels/CRUDModel.dart';
import '../../ui/views/modifyProduct.dart';


class XProductDetails extends StatelessWidget {
  final XProduct xproduct;

  XProductDetails({@required this.xproduct});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<XCrudModel>(context);
    print("-----------productDetails Class working-------");
    print("not : product details: xproduct.name: ${xproduct.name}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: <Widget>[
          
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: ()async {
              await productProvider.removeProduct(xproduct.id);
              Navigator.pop(context) ;
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> XModifyProduct(xproduct: xproduct,)));
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: xproduct.id,
            child: Image.asset(
              'assets/${xproduct.img}.jpg',
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            xproduct.name,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
          Text(
            '${xproduct.price} \$',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.orangeAccent),
          )
        ],
      ),
    );
  }
}