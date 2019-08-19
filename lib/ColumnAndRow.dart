import 'package:flutter/material.dart';

class ClolumnAndRow extends StatefulWidget {


  @override
  _ClolumnAndRow createState() => _ClolumnAndRow();
}

  class _ClolumnAndRow extends State<ClolumnAndRow> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar( title: Text("row and column"),),
          body :Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello world"),
              Text("I an Alex"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello world"),
              Text("I am Alex"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("hello world"),
              Text("I am Alex"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("hello world", style: TextStyle(fontSize: 30.0),),
              Text("I am Alex"),
            ],
          )

        ],
      ));
    }


  }