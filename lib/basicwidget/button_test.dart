import 'package:flutter/material.dart';

class ButtonWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button示例'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text('RaisedButton'),
            ),
            FlatButton(onPressed: () {}, child: Text('FlatButton')),
            OutlineButton(
              onPressed: () {},
              child: Text('OutlineButton'),
            ),
            IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
            RaisedButton.icon(
                onPressed: () {}, icon: Icon(Icons.add), label: Text('add')),
            OutlineButton.icon(
                onPressed: () {}, icon: Icon(Icons.send), label: Text('send')),
            FlatButton.icon(
                onPressed: () {}, icon: Icon(Icons.info), label: Text('info')),
            FlatButton(
              onPressed: () {},
              child: Text('submit'),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
      ),
    );
  }
}
