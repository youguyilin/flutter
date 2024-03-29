import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  _WillPopScopeTestRoute createState() {
    return _WillPopScopeTestRoute();
  }
}

class _WillPopScopeTestRoute extends State<WillPopScopeTestRoute>{
  DateTime _lastPressedAt;//上次点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)){
          //两次点击时间间隔大于1s则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("1s内连续两次返回键退出"),
      ),
    );
  }

}