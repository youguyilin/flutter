import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  _ScrollControllerTestRoute createState() {
    return _ScrollControllerTestRoute();
  }

}

class _ScrollControllerTestRoute extends State<ScrollControllerTestRoute> {

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示"返回顶部按钮"

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener((){
      print(_controller.offset);//打印滚动位置
      if(_controller.offset < 1000 && showToTopBtn){
        setState(() {
          showToTopBtn = false;
        });
      }else if(_controller.offset >= 1000 && showToTopBtn == false){
        setState(() {
          showToTopBtn =true;
        });
      }
    });
  }


  @override
  void dispose() {
    //为了避免内存泄漏
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制"),),
      body: Scrollbar(
        child: ListView.builder(itemBuilder: (context,index){
          return ListTile(title: Text("$index"));
        },
          itemExtent: 50.0,//列表高度固定时，显示指定高度是一个好习惯
          itemCount: 100,
          controller: _controller,
        ),
      ),
      floatingActionButton: !showToTopBtn ? null :FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          //返回到顶部执行动画
          _controller.animateTo(.0, duration: Duration(microseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }

}