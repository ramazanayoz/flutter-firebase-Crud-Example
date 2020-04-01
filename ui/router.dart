import 'package:flutter/material.dart';

import 'views/productDetails.dart';
import 'views/homeView.dart';
import 'views/addProduct.dart';

class XRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/'  :
        return MaterialPageRoute(
          builder:(_) => XHomeView()
        );
      
      case '/addProduct' :
        return MaterialPageRoute(
          builder: (_) => XAddProduct()
        ); 
      
      case '/productDetails':
        return MaterialPageRoute(
          builder: (_) => XProductDetails()
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            )
          )
        );

    }
  }
}