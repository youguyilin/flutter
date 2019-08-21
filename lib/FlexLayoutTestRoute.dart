import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flex"),
        ),
        body: Column(
          children: <Widget>[
            //flex两个widget按1:2来占据水平空间
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,
                //flex的3个子widget，在垂直方向按2:1:1来占用100像素
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Wrap(
              spacing: 8.0, //主轴（水平）方向 间距
              runSpacing: 4.0, //纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("A"),
                  ),
                  label: Text("Hanilton"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("M"),
                  ),
                  label: Text("Lafayette"),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text("H")),
                  label: Text("Mulligan"),
                ),
                Chip(
                  label: Text("Laurens"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("J"),
                  ),
                )
              ],
            ),
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: <Widget>[
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.red,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.lightBlue,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.green,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.brown,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.purple,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.pink,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.deepOrange,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.indigo,
                ),
              ],
            )
          ],
        ));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget（有优化）
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    //指定flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
