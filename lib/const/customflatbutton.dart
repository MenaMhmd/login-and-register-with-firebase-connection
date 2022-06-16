import 'package:flutter/material.dart';

import 'CustomText.dart';

class customsocialbutton extends StatelessWidget {
  final String imagename;
  final String txt;
  final Function onpressed;

  customsocialbutton({this.imagename="", this.txt="",required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),color: Colors.grey
      ),
      child: FlatButton(

          onPressed: onpressed(),
          child: Row(
            children: [
              Image.asset(imagename),
              SizedBox(width: 10),
              Customtext(
                textt: txt,
                fontsize: 15,
              ),
            ],
          )),
    );
  }
}
