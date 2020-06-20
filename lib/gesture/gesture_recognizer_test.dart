import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerWTest extends StatefulWidget {
  @override
  _GestureRecognizerWTestState createState() => _GestureRecognizerWTestState();
}

class _GestureRecognizerWTestState extends State<GestureRecognizerWTest> {
  TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _gestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var centerWidget = Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "你好世界"),
        TextSpan(
          text: "点我变色",
          style: TextStyle(
              fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
          recognizer: _gestureRecognizer
            ..onTap = () {
              setState(() {
                _toggle = !_toggle;
              });
            },
        ),
        TextSpan(text: "你好世界"),
      ])),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('点击测试'),
      ),
      body: centerWidget,
    );
  }
}
