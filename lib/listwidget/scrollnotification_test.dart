import 'package:flutter/material.dart';

class ScrollNotificationWTest extends StatefulWidget {
  @override
  _ScrollNotificationWTestState createState() =>
      _ScrollNotificationWTestState();
}

class _ScrollNotificationWTestState extends State<ScrollNotificationWTest> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动监听'),
      ),
      body: Scrollbar(
          child: NotificationListener(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                }),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return true; //放开此行注释后，进度条将失效
        },
      )),
    );
  }
}
