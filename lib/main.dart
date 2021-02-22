import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_do/pages/a1Page.dart';
import 'package:flutter_do/pages/a2Page.dart';
import 'package:flutter_do/pages/a3Page.dart';
import 'package:flutter_do/pages/a4Page.dart';

import 'package:flutter_do/constant/ThemeColorUtils.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyAppState();

}

class MyAppState extends State <MyApp>{
  final appBarTitles = ['第一','第二','第三','第四'];
  final tabTextStyleSelected = TextStyle(color: const Color(0xFF3B9AFF));
  final tabTextStyleNormal =  TextStyle(color: const Color(0xff969696));
  
  Color themeColor = ThemeColorUtils.currentColorTheme;
  int _tabIndex=0;
  
  var tabImages;
  var _body;
  var pages;
  
  Image getTabImage(path) {
    return Image.asset(path, width: 26.0, height: 26.0);
  }
 
  @override
  void initState(){
    super.initState();
    pages = <Widget>[A1Page(),A2Page(),A3Page(),A4Page()];
    if(tabImages == null){
      tabImages = [
        [getTabImage('images/tabImageN.png'),
        getTabImage('images/tabImageS.png')
        ],
        [getTabImage('images/tabImageN.png'),
          getTabImage('images/tabImageS.png')
        ],
        [getTabImage('images/tabImageN.png'),
          getTabImage('images/tabImageS.png')
        ],
        [getTabImage('images/tabImageN.png'),
          getTabImage('images/tabImageS.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int currIndex){
    if (currIndex == _tabIndex){
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex){
    if (curIndex == _tabIndex){
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle (int curIndex){
    return Text(appBarTitles[curIndex],style: getTabTextStyle(curIndex));
  }
  
  
  @override
  Widget build(BuildContext context) {

    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: themeColor
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitles[_tabIndex], style: TextStyle(color: Colors.white)),
            iconTheme:IconThemeData(color: Colors.white)
          ),
        body: _body,
        bottomNavigationBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0),title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1),title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2),title: getTabTitle(2)),
            BottomNavigationBarItem(icon: getTabIcon(3),title: getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          onTap: (index){
            setState(() {
              _tabIndex=index;
            });
          },
        ),
      ),
    );
  }
}
