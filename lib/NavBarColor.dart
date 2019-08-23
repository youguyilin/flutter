import 'package:flutter/material.dart';

class NavBarColor extends StatelessWidget {

  String title;
  Color color; //背景颜色

  NavBarColor({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          )
        ]
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold,
        //根据背景色亮度来确定title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white :Colors.black,
        ),

      ),
      alignment: Alignment.center,
    );
  }

}