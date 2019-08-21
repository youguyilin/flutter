import 'package:flutter/material.dart';

class StackAndPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stack and positioned"),
      ),
      //通过ConstrainedBox来确保Stack占满屏
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your Friend"),
            )
          ],
        ),
      ),
    );
  }
}
