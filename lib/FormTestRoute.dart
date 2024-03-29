import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() {
    return _FormTestRouteState();
  }
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _upswController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Test"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(key: _formKey,autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)
                    ),
                    validator: (v){
                      return v.trim().length > 0 ? null: "用户名不能为空";
                    },
                  ),
                  TextFormField(
                    controller: _upswController,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                    validator: (v){
                      return v.trim().length > 5? null:"密码不能少于6位";
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("登录"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: (){
                                //在这里不能桐过次方式获取FormState,context不对
                                //print(Form.of(context))
                                //通过_formKey.currentState 获取FormState后，
                                //调用validate()方法校验用户名密码是否合法，校验通过后再提交数据
                                if((_formKey.currentState as FormState).validate()){
                                  //验证通过
                                }
                              }),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
