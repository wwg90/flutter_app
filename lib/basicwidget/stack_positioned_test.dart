import 'package:flutter/material.dart';

class StackPositionedWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack,Positioned布局示例'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
//          fit: StackFit.expand, //未定位widget占满Stack整个空间
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Text('I am Java'),
              left: 20.0,
            ),
            Container(
              color: Colors.red,
              child: Text(
                'Hello Flutter',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Positioned(
              child: Text('I am Android'),
              top: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
