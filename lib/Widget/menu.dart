import 'package:flutter/material.dart';

class MenuXD extends StatefulWidget{

  @override
  State createState() {
    return _MenuXDState();
  }
}

class _MenuXDState extends State<MenuXD> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 22.4,
          height: 2.4,
          color: Color(0xff424242),
        ),
        SizedBox(height: 4.4,),
        Container(
          width: 13,
          height: 2.4,
          color: Color(0xff212121),
        ),
        SizedBox(height: 4.4,),
        Container(
          width: 18,
          height: 2.4,
          color: Color(0xff424242),
        ),
      ],
    );
  }
}