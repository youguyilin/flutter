import 'package:flutter/material.dart';

class EchoRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("注册路由传参数"),
      ),
      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("传递的参数是$args"),
          ],
        ),
      )
    );
  }

}