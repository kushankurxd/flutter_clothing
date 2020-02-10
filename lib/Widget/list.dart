import 'package:flutter/material.dart';
import 'package:flutter_clothing/Util/Helper.dart';
import 'package:flutter_clothing/Util/config.dart';

class ListViewXD extends StatefulWidget{
  ObjectXD _tempObj;

  ListViewXD(this._tempObj);

  @override
  State createState() {
    return _ListViewXDState();
  }
}

class _ListViewXDState extends State<ListViewXD> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 6.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3),
            child: Image.asset(
              '${widget._tempObj.image}',
              width: SizeConfig.safeBlockHorizontal * 20.4,
              height: SizeConfig.safeBlockVertical * 10,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget._tempObj.name}',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.4,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '${widget._tempObj.color}',
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 2.8
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$ ${widget._tempObj.price}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff424242),
              letterSpacing: 0.2,
            ),
          )
        ],
      ),
    );
  }
}