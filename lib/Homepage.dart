import 'package:ecommerce2/constant.dart';
import 'package:ecommerce2/services/Auth.dart';
import 'package:ecommerce2/services/store.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/product.dart';

class Homepage extends StatefulWidget {
  static String id = "homepage";
  @override
  State<StatefulWidget> createState() => Myapp();
}

class Myapp extends State<Homepage> {
  int _tabbarindex = 0;
  final _auth = Auth();
  var products = Product;
  final _store=Store();
  late final User _loggeduser;
   List<Product>? _productsss;



  //Myapp(this._productss);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        DefaultTabController(

            length: 4,
            child: Scaffold(
            /*  bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.person)),
                  BottomNavigationBarItem(icon: Icon(Icons.eleven_mp)),
                  BottomNavigationBarItem(icon: Icon(Icons.add_business)),
                ],
              ),*/
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                  onTap: (value) {
                    setState(() {
                      _tabbarindex = value;
                    });
                  },
                  labelColor: Kmaincolor,
                  tabs: [
                    Text(
                      "jackets",
                      style: TextStyle(
                        color: _tabbarindex == 0 ? Colors.black : Activecolor,
                        fontSize: _tabbarindex == 0 ? 16 : null,
                      ),
                    ),
                    Text(
                      "T_shirt",
                      style: TextStyle(
                        color: _tabbarindex == 1 ? Colors.black : Activecolor,
                        fontSize: _tabbarindex == 1 ? 16 : null,
                      ),
                    ),
                    Text(
                      "Trouser",
                      style: TextStyle(
                        color: _tabbarindex == 2 ? Colors.black : Activecolor,
                        fontSize: _tabbarindex == 2 ? 16 : null,
                      ),
                    ),
                    Text(
                      "shoes",
                      style: TextStyle(
                        color: _tabbarindex == 3 ? Colors.black : Activecolor,
                        fontSize: _tabbarindex == 3 ? 16 : null,
                      ),
                    ),
                  ],
                ),
              ),
              body:  FutureBuilder<List<Product>>(
                  future: _store.loadproducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: Image.asset(_productsss![index].plocation)),
                                Positioned(
                                  child: Center(
                                      child: Opacity(
                                        opacity: .6,
                                        child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            color: Colors.grey,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, top: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(_productsss![index].pname),
                                                  Text('\$ ${_productsss![index].pprice}'),
                                                ],
                                              ),
                                            )),
                                      )),
                                  bottom: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: _productsss!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .8),
                      );
                    }

                     else {
                       //return Center(child: Text("loading....."));

                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                     }

                  )
            ),
            ),

        Material(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover".toUpperCase(),
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Icon(Icons.add_shopping_cart)
              ],
            ),
          ),
        ),


      ],
    );
  }


  @override
  void initState() {
    getcurrentuser();
  }
  getcurrentuser()async
  {
    final FirebaseAuth auth = FirebaseAuth.instance;
    _loggeduser = auth.currentUser!;
    // = await auth.currentUser!();
  }

  Widget jacketview()
  {
    return FutureBuilder<List<Product>>(
        future: _store.loadproducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Image.asset(_productsss![index].plocation)),
                      Positioned(
                        child: Center(
                            child: Opacity(
                              opacity: .6,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(_productsss![index].pname),
                                        Text('\$ ${_productsss![index].pprice}'),
                                      ],
                                    ),
                                  )),
                            )),
                        bottom: 0,
                      )
                    ],
                  ),
                ),
              ),
              itemCount: _productsss!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: .8),
            );
          } else {
            return Center(child: Text("loading....."));
          }
        });
  }
}
