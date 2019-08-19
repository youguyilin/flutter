import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget{
  @override
  _SwitchAndCheckBoxTestRouteState createState() {
    return _SwitchAndCheckBoxTestRouteState();
  }


}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute>{
  bool _SwitchSelected = true;//维护单选开关
  bool _SwitchboxSelected = true;//维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _SwitchSelected,//当前状态
          onChanged: (value){
            //重新构建页面
            setState(() {
              _SwitchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _SwitchboxSelected,
          activeColor: Colors.red,//选中时的颜色
          onChanged: (value){
            setState(() {
              _SwitchboxSelected = value;
            });
          },
        )
      ],
    );
  }

}