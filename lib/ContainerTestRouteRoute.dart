import 'package:flutter/material.dart';
import 'dart:math' as math;
class ContainerTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("container"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          //显示指定对齐方式（左对齐），排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              //左边添加8像素补白
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Hello world"),
            ),
            Padding(
              //上下各添加8像素补白
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("I am Jack"),
            ),
            Padding(
              //指定四个方向补白
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Text("Your friend"),
            ),
            DecoratedBox(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 80,vertical: 18.0),
              child: Text("Login",style: TextStyle(color: Colors.white),),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red,Colors.orange[700]]),//背景渐变
                borderRadius: BorderRadius.circular(3.0),//3像素圆角
                boxShadow: [//阴影
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0
                  )

                ]
              ),
            ),
            Container(
              color: Colors.black,
              child: new Transform(transform: Matrix4.skewY(0.3),
                alignment: Alignment.topRight,//相对与坐标系原点的对齐方式
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8.0,20.0,12.0,8.0),
                  color: Colors.deepOrange,
                  child: const Text("Apartment for rent"),
                ),

              ),//沿Y轴倾斜0。3度
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(offset: Offset(-20.0, -5.0),
              child: Text("Hello world"),),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(angle: math.pi/2,
              child: Text("Hello world"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(scale: 1.5,//放大1。5倍
              child: Text("Hello world"),
              ),
            )
          ],
        ),
      ),
    );
  }

}