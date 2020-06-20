import 'package:flutter/material.dart';

class ScaleWTest extends StatefulWidget {
  @override
  _ScaleWTestState createState() => _ScaleWTestState();
}

class _ScaleWTestState extends State<ScaleWTest> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('缩放测试'),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.asset(
            'images/test.jpg',
            width: _width,
          ),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}
