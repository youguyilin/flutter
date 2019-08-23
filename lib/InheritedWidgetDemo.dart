import 'package:flutter/material.dart';

class SharedataWidget extends InheritedWidget {
  SharedataWidget({@required this.data, Widget child}) : super(child: child);

  int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static SharedataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(SharedataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的widget
  @override
  bool updateShouldNotify(SharedataWidget oldWidget) {
    //如果为true，则子树中依赖（build函数中有调用）本widget
    //的widget的'state.didChangeDependencies'会被调用
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(SharedataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先中的widget中的inheritedWidget改变（updateShouldNotify返回true）时会被调用。
    //如果builder中没有依赖InheritedWidget,则此回调不会被调用

    print("Dependencies change");
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  @override
  _InheritedWidgetDemoState createState() {
    return _InheritedWidgetDemoState();
  }
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SharedataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),
            ),
            RaisedButton(
              child: Text("Increment"),
              //每点击一次，将count自增，然后重新build，ShareDataWidget将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}
