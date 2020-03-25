import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xffFDD148)));
    return MaterialApp(
      title: 'PC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

TabController controller;

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
@override
void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Color(getColorHexFromStr('#FDD148')),
//                  color: Color(0xffFDD148),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 80.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr('#FFE06F'))
                            .withOpacity(0.4),
//                      color: Color(0xffFEE16D).withOpacity(.4)
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 170.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr('#FFE06F'))
                            .withOpacity(0.4),
//                      color: Color(0xffFEE16D).withOpacity(.4)
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 15.0),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/chris.jpg'))),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120.0,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {},
                              color: Colors.white,
                              iconSize: 30.0,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Hello , Eslam',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'What do you want to buy?',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 23.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          color: Colors.black87,
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.amber,
                                  size: 30.0,
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Quicksand')),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Stack(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Material(
                    elevation: 1.0,
                    child: Container(
                      height: 75.0,
//                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/pc4.jpg'))),
                            ),
                            Text(
                              'pc',
                              style: TextStyle(
                                  fontFamily: 'Quicksand', color: Colors.amber),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/lab4.jpg'))),
                            ),
                            Text(
                              'Lap',
                              style: TextStyle(
                                  fontFamily: 'Quicksand', color: Colors.amber),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/key.jpg'))),
                            ),
                            Text(
                              'keybord',
                              style: TextStyle(
                                  fontFamily: 'Quicksand', color: Colors.amber),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/mob5.jpg'))),
                            ),
                            Text(
                              'mobile',
                              style: TextStyle(
                                  fontFamily: 'Quicksand', color: Colors.amber),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              itemCard('Labtop', 'assets/lab1.jpg', false),
              Divider(color: Colors.amber,height: 5.0,),
              itemCard('Pc', 'assets/pc4.jpg', true),
              Divider(color: Colors.amber,height: 5.0,),
              itemCard('Labtop hp', 'assets/lab3.jpg', false),
              Divider(color: Colors.amber,height: 5.0,),
              itemCard('iphon x', 'assets/mob.jpg', true),
              Divider(color: Colors.amber,height: 5.0,),
              itemCard('keybord', 'assets/key.jpg', false)
            ],
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.yellow,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.video_label, color: Colors.yellow)),
            Tab(icon: Icon(Icons.favorite, color: Colors.grey)),
            Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
            Tab(icon: Icon(Icons.person_outline, color: Colors.grey))
          ],
        ),
      ),
    );
  }

  Widget itemCard(String title, String imgpath, bool isfavorite) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 7.5,bottom: 7.7),
      child: Container(
        height: 150.0,
        width: double.infinity,
//        color: Colors.black,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgpath), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 4.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'QuickSand',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 45.0,
                    ),
                    Material(
                      elevation: isfavorite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isfavorite
                                ? Colors.grey[700].withOpacity(0.2)
                                : Colors.white),
                        child: Center(
                            child: isfavorite
                                ? Icon(Icons.favorite_border)
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5.0,),
                Container(
                  width: 175.0,
                  child: Text(
                    'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.grey,
                        fontSize: 12.0
                    ),
                  ),
                ),

                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.0),
                    Container(
                      height: 40.0,
                      width: 50.0,
                      color: Color(getColorHexFromStr('#F9C335')),
                      child: Center(
                        child: Text(
                          '\$248',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 100.0,
                      color: Color(getColorHexFromStr('#FEDD59')),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
