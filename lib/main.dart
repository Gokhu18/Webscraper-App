import 'package:flutter/material.dart';

import 'DisplayProducts.dart';
import 'ProductPodo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(MaterialApp(
    title: 'Webscraper',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    firebaseCloudMessaging_Listeners();
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
//      body: DisplayProducts(products: new List<ProductDetails>()),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        tooltip: 'Add product',
//        onPressed: null,
//      ),
    );
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }
}
