import 'dart:collection';

import 'package:flutter/material.dart';

import 'ProviderDemo.dart';

class Item {
  Item(this.price, this.count);

  double price;
  int count;
}

class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  List<Item> _items = [];

  //禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //购物车中商品总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  //将【item】添加到购物车，这是唯一一种能从外部改变购物车的方法
  void add(Item item) {
    _items.add(item);
    //通知监听器（订阅者），重新构建InheritedProvider,更新状态。
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() {
    return _ProviderRouteState();
  }
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNOtifilerProvider<CartModel>(
        data: CartModel(),
        child: Builder(
          builder: (context) {
            return Column(
              children: <Widget>[
                Builder(
                  builder: (context) {
                    var cart = ChangeNOtifilerProvider.of<CartModel>(context);
                    return Text("总价：${cart.totalPrice}");
                  },
                ),
                Builder(
                  builder: (context) {
                    print("RaisedButton build");
                    return RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        //给购物车中添加商品
                        ChangeNOtifilerProvider.of<CartModel>(context)
                            .add(Item(20.1, 1));
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
