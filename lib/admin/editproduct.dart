import 'package:ecommerce2/services/store.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';
import 'addproduct.dart';

class Editproduct extends StatefulWidget {
  static String id = "editproduct";

  @override
  State<Editproduct> createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {
  var products = Product;
  final _store = Store();
  late List<Product> _productss;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Product>>(
            future: _store.loadproducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTapUp: (detail) {
                        double dx = detail.globalPosition.dx;
                        double dy = detail.globalPosition.dy;
                        double dx2 = MediaQuery.of(context).size.width - dx;
                        double dy2 = MediaQuery.of(context).size.width - dy;

                        showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                            items: [
                              MyPopmenu(
                                  child: Text("Edit"),
                                  onclick: () {
                                    Navigator.pushNamed(context,Addproduct.id);
                                  }),
                              MyPopmenu(
                                  child: Text("Delete"),
                                  onclick: () {
                                  //  _store.deleteproduct(document_id);
                                  })
                            ]);
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.asset(_productss[index].plocation)),
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
                                        Text(_productss[index].pname),
                                        Text('\$ ${_productss[index].pprice}'),
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
                  itemCount: _productss.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .8),
                );
              } else {
                return Center(child: Text("loading....."));
              }
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    getproducts();
  }

  void getproducts() async {
    _productss = await _store.loadproducts();
  }
}

class MyPopmenu<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onclick;

  MyPopmenu({required this.child, required this.onclick}) : super(child: child);

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }
}

class MyPopupMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, MyPopmenu<T>> {
  @override
  void handleTap() {
    widget.onclick();
    print("hello");
    Navigator.pop(context);
  }
}
