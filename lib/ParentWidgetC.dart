import 'package:flutter/material.dart';

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() {
    return _ParentWidgetCState();
  }

}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapBoxChanged(bool value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(active: _active,onChanged: _handleTapBoxChanged),
    );
  }

}

class TapBoxC extends StatefulWidget {
  TapBoxC({
    Key key, this.active: false,
    @required this.onChanged
  }):super(key:key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() {
    return _TapBoxCState();
  }


}

class _TapBoxCState extends State<TapBoxC>{
  bool _highLight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highLight = true;
    });
  }


  void _handleTapUp(TapUpDetails upDetails){
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',style: TextStyle(fontSize: 30.0,color: Colors.white),),
        ),
        decoration: BoxDecoration(
          color: widget.active? Colors.lightBlue[600]:Colors.grey[300],
          border: _highLight? Border.all(color: Colors.teal[700],
          width: 10.0): null,
        ),
      ),
    );
  }

}