import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce2/constant.dart';

import '../model/product.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addproduct(Product product1) {
    _firestore.collection(productcollection).add({
      productname: product1.pname,
      productdescription: product1.pdescription,
      productlocation: product1.plocation,
      productprice: product1.pprice,
      productcategory: product1.pcategory,
    });
  }

  Future<List<Product>> loadproducts() async {

    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection(productcollection);
    QuerySnapshot querySnapshot = await _collectionRef.get();

    var snapshot = await _firestore.collection(productcollection).get();
    List<Product> products = [];
    for (var doc in snapshot.docs) {
      var data = doc.data();
      products.add(Product(
          pname: data[productname],
          pdescription: data[productdescription],
          pcategory: data[productcategory],
          pprice: data[productprice],
          plocation: data[productlocation])
      );
    }
    return products;
  }
  Stream<QuerySnapshot>loadproduct()
  {
    return _firestore.collection(productcollection).snapshots();
  }

  deleteproduct(document_id)
  {
    _firestore.collection(productcollection).doc(document_id).delete();
  }
}
