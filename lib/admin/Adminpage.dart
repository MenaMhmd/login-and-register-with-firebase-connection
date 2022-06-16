import 'package:ecommerce2/admin/addproduct.dart';
import 'package:ecommerce2/constant.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';
import '../services/store.dart';
import 'editproduct.dart';

class Adminpage extends StatelessWidget {
  static String id = "adminpage";
  final _store=Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kmaincolor,
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Addproduct.id);
              },
              child: Text("Add Product"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Editproduct.id);
              },
              child: Text("Edit Product"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {

              },
              child: Text("View Product"),
            ),
          ],
        ),
      ),
    );
  }
}
