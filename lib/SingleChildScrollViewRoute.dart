import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(//显示进度条
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<widget>
            children: str.split("").map((c)=>Text(c,textScaleFactor: 2.0)).toList(),
          ),
        ),
      ),

    );
  }

}