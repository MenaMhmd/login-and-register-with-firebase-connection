import 'package:ecommerce2/const/textfield.dart';
import 'package:ecommerce2/provider/Adminmode.dart';
import 'package:ecommerce2/admin/Adminpage.dart';

import 'package:ecommerce2/view/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Homepage.dart';
import '../const/CustomText.dart';
import '../const/Custombutton.dart';
import '../const/customflatbutton.dart';
import '../constant.dart';
import '../services/Auth.dart';
import 'Secondscreen.dart';

class Login extends StatelessWidget {
  final _auth = Auth();
  bool isadmin = true;
  late String _email, _password;
  static String id = "login";
  String adminpass = "admin1234";
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kmaincolor,
      body: Form(
        key: globalKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Container(
                height: MediaQuery.of(context).size.height * .3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/buyicon.png"),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            "Buy it",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextFormField(
                onSaved: (value) {
                  _email = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'value is empty';
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  iconColor: Kmaincolor,
                  hintText: "Enter Email",
                  filled: true,
                  fillColor: Secondarycolor,
                  focusColor: Secondarycolor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextFormField(
                onSaved: (value) {
                  _password = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'value is empty';
                  }
                },
                decoration: InputDecoration(
                  iconColor: Kmaincolor,
                  hintText: "Enter PhoneNumber",
                  fillColor: Secondarycolor,
                  focusColor: Secondarycolor,
                  filled: true,
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: FlatButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    validate(context);
                   /* if (globalKey.currentState!.validate()) {
                      globalKey.currentState?.save();
                      print("emailllllogin");
                      print(_email);
                      print(_password);
                      try {
                        final authresult =
                            await _auth.signin(_email, _password);
                        print(authresult.user?.uid);
                        Navigator.pushNamed(context, Homepage.id);
                      } catch (e) {
                        print("*************");
                        print(e.toString());
                      }
                    }*/
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Signup.id);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Provider.of<Adminmode>(context, listen: false)
                        .changeisAdmin(true);
                  },
                  child: Text(
                    "I'm admin",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Provider.of<Adminmode>(context).isAdmin
                            ? Kmaincolor
                            : Colors.white),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Provider.of<Adminmode>(context, listen: false)
                        .changeisAdmin(false);
                  },
                  child: Text(
                    "I'm user",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Provider.of<Adminmode>(context).isAdmin
                            ? Colors.white
                            : Kmaincolor),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),

      /* Padding(
       padding: EdgeInsets.only(top: 50, right: 10, left: 10),
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Customtext(textt: "welcome", fontsize: 30),
               Customtext(
                 textt: "Sign Up",
                 fontsize: 18,
                 colorr: Colors.blueAccent,
               ),
             ],
           ),

           SizedBox(height: 10,),
           Customtext(
             textt: "Sign in to continue",
             fontsize: 14,
             colorr: Colors.grey,
           ),
           SizedBox(
             height: 30,
           ),
           /*  Textfield(
              hinttextt: "enter your email",
              Textt: "email",
              onsaved: (value) {},
              validator: (value) {},
            ),
            SizedBox(
              height: 30,
            ),*/
           Column(
             children: [
               Text(
                 "email",style: TextStyle(fontSize: 15),textAlign: TextAlign.start,
               ),
               TextFormField(


                 decoration: InputDecoration(
                   hintText: "hinttextt",
                   hintStyle: TextStyle(color: Colors.white),
                   fillColor: Colors.white,
                 ),
               ),
             ],
           ),

           SizedBox(height: 15,),
           Customtext(textt: "forget password",alignment: Alignment.topRight,fontsize: 15,),

           SizedBox(height: 10,),
           Custombutton(textt: "Sign in",Collor:Colors.green,onpressed: (){MaterialPageRoute(builder: (context)=>Secondscreen());},),
           SizedBox(height: 20,),
           Customtext(textt: "-OR-",alignment: Alignment.center,),
           SizedBox(height: 40,),
           customsocialbutton(onpressed: (){},txt: "sign in with google",),
           SizedBox(height: 40,),
           customsocialbutton(onpressed: (){},txt: "sign in with facebook",),



         ],
       ),
     ),*/
    );
  }

  void validate(BuildContext context) async{
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (Provider.of<Adminmode>(context, listen: false).isAdmin) {
        if (_password == adminpass) {
          try {
           await _auth.signin(_email, _password);
            Navigator.pushNamed(context, Adminpage.id);
          } on PlatformException catch (e) {
            print("adminerror");
            print(e.message);
          }
        }
      } else {
        try {
          await _auth.signin(_email, _password);
          Navigator.pushNamed(context, Homepage.id);
        } on PlatformException catch (e) {
          print("userpageerror");
          print(e.message);
        }
      }
    }
  }
}
