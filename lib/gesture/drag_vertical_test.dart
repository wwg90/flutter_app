import 'package:flutter/material.dart';

//垂直滑动
class DragVerticalWTest extends StatefulWidget {
  @override
  _DragVerticalWTestState createState() => _DragVerticalWTestState();
}

class _DragVerticalWTestState extends State<DragVerticalWTest> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              }),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('垂直滑动'),
      ),
      body: stack,
    );
  }
}
