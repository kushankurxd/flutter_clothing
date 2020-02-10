import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clothing/Util/config.dart';

class CartXD extends StatefulWidget{

  String image, name,color,price;
  CartXD(this.image,this.name,this.color,this.price);

  @override
  State createState() {
    return _CartXDState();
  }
}

class _CartXDState extends State<CartXD> {
  int count = 1;
  double price = 0.0;


  @override
  void initState() {
    price = double.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            '${widget.image}',
            fit: BoxFit.fitHeight,
            height: SizeConfig.screenHeight * 0.7,
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 6,left: SizeConfig.safeBlockHorizontal * 7,right: SizeConfig.safeBlockHorizontal * 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back,color: Color(0xff424242),size: SizeConfig.safeBlockHorizontal * 5.6,)),
                Icon(Icons.search,color: Color(0xff424242),size: SizeConfig.safeBlockHorizontal * 5.6,),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.safeBlockVertical * 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 8.4),
                                                topRight: Radius.circular(SizeConfig.safeBlockHorizontal * 8.4)),
                color: Colors.white,
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 10,top: SizeConfig.safeBlockHorizontal * 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget.name}',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 6.8,
                        fontFamily: 'Poppins',
                        wordSpacing: 2,
                        letterSpacing: 0.2,
                        color: Color(0xff424242)
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockHorizontal * 0.2,),
                    Text(
                      '${widget.color}',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff616161),
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockHorizontal * 8.4,),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: SizeConfig.safeBlockHorizontal * 3,
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 5,),
                        CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: SizeConfig.safeBlockHorizontal * 3,
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 5,),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: SizeConfig.safeBlockHorizontal * 3,
                        ),

                        SizedBox(width: SizeConfig.safeBlockHorizontal * 20,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              count =
                              count > 1 ? count - 1 : count;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xff757575)),borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 0.4,
                                                            horizontal: SizeConfig.safeBlockHorizontal * 2),
                              child: Icon(Icons.remove,size: SizeConfig.safeBlockHorizontal * 5.4,color: Color(0xff424242),),
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 4,),
                        Text(
                          '$count',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff424242),
                          ),
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 4,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              count =
                              count < 5 ? count + 1 : count;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xff757575)),borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 0.8,
                                  horizontal: SizeConfig.safeBlockHorizontal * 2.4),
                              child: Icon(Icons.add,size: SizeConfig.safeBlockHorizontal * 4.4,color: Color(0xff424242),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 4.4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 12.4,
                          height: SizeConfig.safeBlockVertical * 5.8,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffef5350),width: 1.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.favorite,color: Color(0xffe57373),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 10.4),
                          child: RaisedButton(
                            onPressed: (){},
                            color: Color(0xffe57373),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3)),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1.2,horizontal: SizeConfig.safeBlockHorizontal * 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    '\$ ${(price*count).toStringAsFixed(2)}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.2,
                                        wordSpacing: 2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeConfig.safeBlockHorizontal * 4
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.safeBlockHorizontal * 16,),
                                  Icon(Icons.arrow_forward,color: Colors.white,)
                                ],
                              ),
                            )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}