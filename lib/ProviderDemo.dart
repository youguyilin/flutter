import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  T data; //共享状态使用范型
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    //在此简单返回true。每次更新都会调用依赖其子孙节点的'didChangeDependencies'
    return true;
  }
}

//该方法用于在Dart中获取模版类型
Type _typeOf<T>() => T;

class ChangeNOtifilerProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNOtifilerProvider({
    Key key,
    this.data,
    this.child,
  });

  Widget child;
  T data;

  @override
  _ChangeNOtifilerProviderState<T> createState() {
    return _ChangeNOtifilerProviderState<T>();
  }

  //定义一个便捷的方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider =
        context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
    return provider.data;
  }
}

class _ChangeNOtifilerProviderState<T extends ChangeNotifier> extends State<ChangeNOtifilerProvider> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners),重新构建InheritedProvider
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNOtifilerProvider<T> oldWidget) {
    //当Provider更新时，如果旧数据不"=="，则解绑就数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
