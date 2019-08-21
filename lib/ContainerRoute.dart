import 'package:flutter/material.dart';

class ContainerRoute extends StatelessWidget {
  //Container 是一个组合累容器，它本身不对应具体的RendObject,它是DecoratedBox\ConstrainedBox\Transform\Padding\Align等
  //组件组合的一个多功能容器，
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container"),),
      body: Container(
        margin: EdgeInsets.only(top: 50.0,left: 120.0),//容器外填充
        constraints: BoxConstraints.tightFor(width: 200.0,height: 150.0),//卡片大小
        decoration: BoxDecoration(//背景装饰
          gradient: RadialGradient(colors: [Colors.red,Colors.orange],
            center: Alignment.topLeft,
            radius: .98
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
            )
          ]
        ),
        transform: Matrix4.rotationZ(.2),//卡片倾斜变换
        alignment: Alignment.center,
        child: Text("5.20",style: TextStyle(color: Colors.white,fontSize: 40.0),),
      ),
    );
  }

}