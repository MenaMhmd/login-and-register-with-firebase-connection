import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomText.dart';

class Textfield extends StatelessWidget {
  final String Textt;
  final double fontsizee;
  final String hinttextt;
  final Color Colorss;
  final Function onsaved;
  final Function validator;
  Textfield(
      {this.Textt = "",
      this.fontsizee = 15,
      this.hinttextt = "",
      this.Colorss = Colors.black,
      required this.onsaved,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtext(
          textt: Textt,
          fontsize: fontsizee,
        ),
        TextFormField(
          onSaved: onsaved(),
          validator: validator(),
          decoration: InputDecoration(
            hintText: hinttextt,
            hintStyle: TextStyle(color: Colorss),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
