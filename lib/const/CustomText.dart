import 'package:flutter/material.dart';

class Customtext extends StatelessWidget{
  final String textt;
 final Color colorr;
  final double fontsize;
  final Alignment alignment;
   Customtext({ this.textt="", this.colorr=Colors.black, this.fontsize=30,this.alignment=Alignment.topLeft}) ;
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Text(textt,style: TextStyle(fontSize: fontsize,color: colorr),),

   );
  }
}