import 'package:flutter/material.dart';

class AlignRoute extends StatelessWidget {

  //简单调整一个子元素在父元素中的位置使用Align
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Align"),),
      body: Container(
//        height: 120.0,
//        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          heightFactor: 3,
          widthFactor: 2,
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }

}