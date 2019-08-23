import 'package:flutter/material.dart';

class AlertDialogRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("对话框1"),
          onPressed: () async {
            //弹出对话框 并等待其关闭
            bool delete = await showDeleteConfirmDialog1(context);
            if(delete == null){
              print("取消删除");
            }else {
              print("已确认删除");
            }
          },
        )
      ],
    );
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确认要删除当前文件吗？"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: ()=>Navigator.of(context).pop(),//关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                Navigator.of(context).pop(true);//关闭对话框并返回true
              },
            )
          ],
        );
      }
    );
  }

}