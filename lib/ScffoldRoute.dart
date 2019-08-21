import 'package:flutter/material.dart';

import 'MyDrawer.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController;//需要定义一个controller
  List tabs = ["新闻","历史","图片"];


  @override
  void initState() {
    super.initState();
    //创建controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Name"),
          actions: <Widget>[
            //导航栏右侧菜单
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
          leading: Builder(builder: (context){
            return IconButton(
              icon: Icon(Icons.dashboard,color: Colors.white,),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },),
          bottom: TabBar(
              controller: _tabController,
              tabs: tabs.map((e)=>Tab(text: e,)).toList()),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          controller: _tabController,
            children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5,),
          );
        }).toList()),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), title: Text('Home')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onAdd,
          child: Icon(
            Icons.add,
          ),
        ));
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void _onAdd() {}
}
