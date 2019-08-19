import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {

    final wordPair = new WordPair.random();

    return Scaffold(
        appBar: AppBar(
          title: Text(wordPair.toString()),
        ),
        body: Padding(
            padding: EdgeInsets.all(18),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(text),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context, "我是返回值"),
                    child: Text("返回"),
                  )
                ],
              ),
            )));
  }
}
