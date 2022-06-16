import 'package:ecommerce2/admin/addproduct.dart';
import 'package:ecommerce2/provider/Adminmode.dart';
import 'package:ecommerce2/admin/Adminpage.dart';

import 'package:ecommerce2/view/Signup.dart';
import 'package:ecommerce2/view/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Homepage.dart';
import 'admin/editproduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Adminmode>(
          create: (context) => Adminmode(),
        )
      ],
      child: MaterialApp(
        initialRoute: Signup.id,
        routes: {
          Editproduct.id: (context) => Editproduct(),
          Login.id: (context) => Login(),
          Signup.id: (context) => Signup(),
          Homepage.id: (context) => Homepage(),
          Adminpage.id: (context) => Adminpage(),
          Addproduct.id: (context) => Addproduct(),
          Editproduct.id: (context) => Editproduct(),
        },
      ),
    );
  }
}
