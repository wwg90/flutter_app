import 'package:flutter/material.dart';

class ContainerWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container布局示例'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 130.0),
        constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
        decoration: BoxDecoration(
            gradient: RadialGradient(
                //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98),
            boxShadow: [
              //卡片阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        transform: Matrix4.rotationZ(.2),
        //卡片倾斜变换
        alignment: Alignment.center,
        //卡片内文字居中
        child: Text(
          //卡片文字
          "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
}
