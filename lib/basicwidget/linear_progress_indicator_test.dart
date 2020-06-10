import 'package:flutter/material.dart';

class LinearProgressIndicatorWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进度条示例'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            Divider(),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            )
          ],
        ),
      ),
    );
  }
}
