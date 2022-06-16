import 'package:ecommerce2/services/store.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/product.dart';

class Addproduct extends StatelessWidget {
  static String id = "addproduct";
  late final String _namee, _description, _price, _category, _location;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Form(
        key: globalKey,
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Kmaincolor,
                  onSaved: (value) {
                    _namee = value!;
                  },
                  decoration: InputDecoration(
                    hintText: "product name",
                    filled: true,
                    fillColor: Secondarycolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: Kmaincolor,
                  onSaved: (value) {
                    _price = value!;
                  },
                  decoration: InputDecoration(
                    hintText: "product price",
                    filled: true,
                    fillColor: Secondarycolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onSaved: (value) {
                    _description = value!;
                  },
                  cursorColor: Kmaincolor,
                  decoration: InputDecoration(
                    hintText: "product description",
                    filled: true,
                    fillColor: Secondarycolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: Kmaincolor,
                  onSaved: (value) {
                    _category = value!;
                  },
                  decoration: InputDecoration(
                    hintText: "product category",
                    filled: true,
                    fillColor: Secondarycolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onSaved: (value) {
                    _location = value!;
                  },
                  decoration: InputDecoration(
                    hintText: "product location",
                    filled: true,
                    fillColor: Secondarycolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {

                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState?.save();
                      _store.addproduct(Product(
                          pdescription: _description,
                          pname: _namee,
                          pcategory: _category,
                          plocation: _location,
                          pprice: _price));
                    }
                  },
                  child: Text("Add product"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
