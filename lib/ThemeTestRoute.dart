import 'package:flutter/material.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() {
    return _ThemeTestRouteState();
  }
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏，FloatActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("主题测试"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主题")
              ],
            ),
            Theme(
                data: themeData.copyWith(
                  iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("颜色固定黑色")
                  ],
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            setState(() => _themeColor =
                _themeColor == Colors.teal ? Colors.blue : Colors.teal),
          },
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
