import 'package:flutter/material.dart';

import 'CustomText.dart';

class Custombutton extends StatelessWidget {
  final Color Collor;
  final String textt;
  final Color textColors;
  final Function onpressed;
  final Alignment alignment;

  Custombutton(
      {required this.onpressed,
        this.Collor = Colors.black,
      this.textt = "",
      this.textColors = Colors.white,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.green),
      child: FlatButton(
          color: Collor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(18),
          onPressed: onpressed(),
          child: Customtext(
            textt: textt,
            colorr: textColors,
            alignment: alignment,
          )),
    );
  }
}
