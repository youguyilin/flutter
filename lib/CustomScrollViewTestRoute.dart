import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Material Design默认的样式风格，我们使用Material作为路由的根
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //appBar,包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("demo"),
              background: Image.asset("./iamges/avatar.png",fit:BoxFit.cover),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid( gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,//按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio:4.0,
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context,int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index %9)],
                child: Text('grid item $index'),
              );
            },childCount: 20),
            ),

          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },childCount: 50  ),
          )

        ],
      ),
    );
  }

}