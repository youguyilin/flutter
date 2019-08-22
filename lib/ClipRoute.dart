import 'package:flutter/material.dart';

class ClipRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //头像
    Widget avatar = Image.asset(
      "images/avatar.png",
      width: 60.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("clip"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar, //不裁剪
            Expanded(
                child: ClipOval(
              child: avatar,
            )),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),
            ), //裁剪为圆形
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度的一半，另一半会溢出
                  child: avatar,
                ),
                Text(
                  "你好世界",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  //将溢出部分裁剪
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text(
                  "你好世界",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
