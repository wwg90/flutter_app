import 'package:flutter/material.dart';

class GestureDetectorWTest extends StatefulWidget {
  @override
  _GestureDetectorWTestState createState() => _GestureDetectorWTestState();
}

class _GestureDetectorWTestState extends State<GestureDetectorWTest> {
  String _operation = "No Gesture detected!"; //保存事件名

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势测试'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: 200.0,
            height: 100.0,
            color: Colors.blue,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText('点击'),
          onDoubleTap: () => updateText('双击'),
          onLongPress: () => updateText('长按'),
        ),
      ),
    );
  }
}
