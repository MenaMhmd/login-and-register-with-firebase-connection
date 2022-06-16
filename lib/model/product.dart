import 'package:flutter/material.dart';

class Product {
  String pname;
  //String pid;
  String pdescription;
  String pcategory;
  String pprice;
  String plocation;

  Product(
      {required this.pname,
      required this.pdescription,
      required this.pcategory,
     // required this.pid,
      required this.pprice,
      required this.plocation});
}
