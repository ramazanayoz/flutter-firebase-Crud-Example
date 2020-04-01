import 'package:flutter/material.dart';

import '../../core/models/productModel.dart';
import '../../ui/views/productDetails.dart';


class XProductCard extends StatelessWidget {
  //var
  final XProduct xproduct;
  //const
  XProductCard({@required this.xproduct});

  @override
  Widget build(BuildContext context) {
    print("-productCard calss working-");
    print("productCard: xproduct.name: ${xproduct.name}");
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (_) => XProductDetails(xproduct: xproduct))
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context)
              .size
              .height*0.45,
            width: MediaQuery.of(context)
              .size
              .width*0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: xproduct.id,
                  child: Image.asset(
                    'assets/${xproduct.img}.jpg',
                    height: MediaQuery.of(context)
                    .size
                    .height*0.25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        xproduct.name,
                        style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic
                        ), 
                      ),
                      RaisedButton(
                        onPressed: (){
                          print(xproduct.name);
                          }
                      ), 
                      Text(
                        '${xproduct.price} \$',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent,        
                        ),
                      ),
                    ],
                  ),
                ),                
              ],
            ),
          ),
        ),
      ),
    );
  }
}