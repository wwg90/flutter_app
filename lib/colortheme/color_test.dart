import 'package:flutter/material.dart';

class ColorWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('颜色主题'),
      ),
      body: Column(
        children: [
          NavBar(color: Colors.blue, title: "标题一",),
          NavBar(color: Colors.white, title: "标题二",),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color;

  NavBar({Key key, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52.0,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
              color: Colors.black26, blurRadius: 3.0, offset: Offset(0, 3)),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
