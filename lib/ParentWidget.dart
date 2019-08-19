import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() {
    return _ParentWidgetState();
  }


}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:TapBoxB(active: _active,onChanged: _handleTapBoxChanged),
    );
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({
    Key key,
    this.active: false,
    @required this.onChanged
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handlerTap() {
    onChanged(!active);
  }


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handlerTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Center(
          child: Text(active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),),
        ),
        decoration: BoxDecoration(
          color: active ? Colors.red[600] : Colors.grey[500],
        ),
      ),
    );
  }

}