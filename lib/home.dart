import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clothing/Transition/Scale.dart';
import 'package:flutter_clothing/Util/Helper.dart';
import 'package:flutter_clothing/Util/config.dart';
import 'package:flutter_clothing/Widget/list.dart';
import 'package:flutter_clothing/Widget/menu.dart';
import 'package:flutter_clothing/cart.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List list = womenList;
  List _category = ['Womens', 'Mens', 'Teens',];
  int _selected = 0;
  ScrollController _controller = new ScrollController();

  _setSelected(int val){
    List _temp;
    switch(val){
      case 0: _temp = womenList;
              break;
      case 1: _temp = menList;
              break;
      case 2: _temp = teenList;
              break;
      default: _temp = womenList;
              break;
    }
    setState(() {
      list = _temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 7.4,),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //Top app bar
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 4.4,right: SizeConfig.safeBlockHorizontal * 6.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MenuXD(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.4),
                        child: Image.asset(
                          'img/profile.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),

                //Title and subtitle
                SizedBox(height: SizeConfig.safeBlockVertical * 3.6,),
                Text(
                  'Elegance',
                  style: TextStyle(
                    fontFamily: 'Libre',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.safeBlockHorizontal * 9.6,
                    color: Color(0xffe57373),
                    letterSpacing: 0.2
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical,),
                Text(
                  'The best clothing collection for you.',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.3,
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    wordSpacing: 0.4
                  ),
                ),


                //Category top bar
                SizedBox(height: SizeConfig.safeBlockVertical * 4.4,),
                SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 12.4,
                    width: SizeConfig.screenWidth,
                    child: ListView.builder(
                        controller: _controller,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _category.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 1.2),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selected = index;
                                  _setSelected(index);
                                  if(index == 2){
                                  _controller.jumpTo(_controller.position.maxScrollExtent);
                                  }
                                  if(index == 0){
                                  _controller.jumpTo(0.0);
                                  }
                                });
                              },
                              child: Card(
                                elevation: 2,
                                color: index == _selected ? Color(0xffef5350) : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 1.6),
                                ),
                                child: Container(
                                  width: SizeConfig.safeBlockHorizontal * 34,
                                  child: Center(
                                    child: Text(
                                      '${_category[index]}',
                                      style: TextStyle(
                                        color: index ==  _selected ? Colors.white : Color(0xff616161),
                                        fontSize: index == _selected ? SizeConfig.safeBlockHorizontal * 3.8
                                            : SizeConfig.safeBlockHorizontal * 3.4,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                ),


                //Shop
                SizedBox(height: SizeConfig.safeBlockVertical * 2.4,),
                SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 133,
                    width: SizeConfig.screenWidth,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: SizeConfig.safeBlockHorizontal * 92,
                              width: SizeConfig.screenWidth,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context,index){
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, ScaleRoute(page:
                                      CartXD(list[index].image,list[index].name,list[index].color,list[index].price)
                                      ));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 6),
                                      child: Container(
                                        width: SizeConfig.safeBlockHorizontal * 50,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3.4),
                                                  child: Image.asset(
                                                    '${list[index].image}',
                                                    fit: BoxFit.contain,
                                                    width: SizeConfig.safeBlockHorizontal * 50,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 62,left: SizeConfig.safeBlockHorizontal * 38),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      setState(() {
                                                        list[index].favorite  = list[index].favorite ? false : true;
                                                      });
                                                    },
                                                    child: Card(
                                                      elevation: 4,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 4.2)),
                                                      child: CircleAvatar(
                                                        radius: SizeConfig.safeBlockHorizontal * 4.2,
                                                        backgroundColor: Colors.white,
                                                        child: list[index].favorite ? Icon(Icons.favorite,color: Colors.red,size: 18,)
                                                            : Icon(Icons.favorite_border,color: Colors.redAccent,size: 18,),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: SizeConfig.safeBlockHorizontal * 4,),
                                            Text(
                                              '${list[index].name}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.2,
                                                  wordSpacing: 1.4,
                                                  color: Color(0xff424242)
                                              ),
                                            ),
                                            SizedBox(height: SizeConfig.safeBlockHorizontal * 2,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2.4),
                                                color: Color(0xffe57373),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 6.4),
                                                child: Text(
                                                  '\$ ${list[index].price}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w500,
                                                      letterSpacing: 0.2
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: SizeConfig.safeBlockVertical * 3.4,),
                            Text(
                              'Best Selling Products',
                              style: TextStyle(
                                fontFamily: 'PlayFair',
                                fontSize: SizeConfig.safeBlockHorizontal * 6.8,
                                color: Color(0xff424242),
                              ),
                            ),

                            SizedBox(height: SizeConfig.safeBlockVertical * 1.8,),
                            ListViewXD(list[2]),
                            SizedBox(height: SizeConfig.safeBlockVertical * 1.6,),
                            ListViewXD(list[3]),
                            SizedBox(height: SizeConfig.safeBlockVertical * 1.6,),
                            ListViewXD(list[0]),
                            SizedBox(height: SizeConfig.safeBlockVertical * 1.6,),
                            ListViewXD(list[1]),
                            SizedBox(height: SizeConfig.safeBlockVertical * 1.8,),
                            Center(
                              child: Icon(Icons.keyboard_arrow_down,color: Colors.grey[800],),
                            )
                          ],
                        )
                    ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 6.4,top: SizeConfig.safeBlockVertical * 0.8),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.home, color: Color(0xffe57373),),
                        Icon(Icons.search),
                        Icon(Icons.favorite_border),
                        Icon(Icons.person_outline),
                      ],
                    ),
                  ),
                ),// This trailing comma
              ],
            )
          ],
        ),
      ),
    );
  }
}
