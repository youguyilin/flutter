import 'package:flutter/material.dart';

import 'CouterWidget.dart';
import 'EchoRoute.dart';
import 'FormTestRoute.dart';
import 'NewRoute.dart';
import 'ColumnAndRow.dart';
import 'ParentWidget.dart';
import 'ParentWidgetC.dart';
import 'ProgressRoute.dart';
import 'RouterTestRoute.dart';
import 'SwitchAndCheckBoxTestRoute.dart';
import 'TaoboxA.dart';
import 'TipRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      routes: {
        "new_pages": (context) => NewRoute(),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "echo": (context) => EchoRoute(),
        "tip": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "mywidget": (context) => CounterWidget()
      },
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  static const testSyle = const TextStyle(
    fontFamily: 'Oswald',
  );

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    return FormTestRoute();
        return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Center(
                child: Text.rich(TextSpan(children: [
              TextSpan(text: "home: "),
              TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue, fontFamily: 'Oswald'),
                  recognizer: null),
            ]))),
            RaisedButton(
              child: Text("normal"),
              onPressed: (){},
            ),
            FlatButton(
              child: Text("normal"),
              onPressed: (){},
            ),
            OutlineButton(
              child: Text("normal"),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up) ,
              onPressed: (){},
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){},
            ),
            Image(image: AssetImage("images/avatar.png"),width: 100.0,color: Colors.blue,colorBlendMode: BlendMode.difference,),
            Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",width: 100.0,),
            Text("\uE914"+ "\uE000" + "\uE90D",style: TextStyle(fontFamily: "MaterialIcons",fontSize: 24.0,color: Colors.blue),)
            ,SwitchAndCheckBoxTestRoute(),
            TextField(
              focusNode: focusNode1,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),

              ),
            ),
            TextField(
              focusNode: focusNode2,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
            Builder(builder: (ctx){
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点移动到第二个Textfield
                      if(null == focusScopeNode){
                        focusScopeNode = FocusScope.of(context);
                      }
                      if(focusNode1.hasFocus) {
                        focusScopeNode.requestFocus(focusNode2);
                      }else {
                        focusScopeNode.requestFocus(focusNode1);
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: (){
                      //当所有哦编辑框都失去焦点的时候键盘就会收起
                      focusNode2.unfocus();
                      focusNode1.unfocus();
                    },
                  )
                ],
              );
            }),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.pink),
            ),ProgressRoute(),
          ],
        ));

//      Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            FlatButton(
//              child: Text("open new route"),
//              textColor: Colors.blue,
//              onPressed: () {
//                //导航到新路由
////                Navigator.pushNamed(context, "mywideget");
////                Navigator.of(context).pushNamed("tip",arguments: "hi");
////                Navigator.push(context, MaterialPageRoute(builder: (context) {
////                  return RouterTestRoute();
////                }));
//              },
//            )
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }
}
