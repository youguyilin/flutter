import 'package:flutter/material.dart';

import 'TipRoute.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试路由传值"),
      ),
      body:
        Center(
          child: RaisedButton(onPressed: () async {
            //打开TipRoute 并等待返回值
            var result = await Navigator.push(
                context,MaterialPageRoute(builder: (context) {
              return TipRoute(
                //路由参数
                text:"我传给你",
              );
            })
            );
            print("路由返回值：$result");
          },
            child: Text("打开提示页"),

          ),
        ));
  }

}