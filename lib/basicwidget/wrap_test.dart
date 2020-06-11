import 'package:flutter/material.dart';

class WrapWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap布局示例'),
      ),
      body: Wrap(
        spacing: 8.0,
        runSpacing: 5.0,
        alignment: WrapAlignment.center,
        children: [
          Chip(
            label: Text('Ailike'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
          ),
          Chip(
            label: Text('Heigo'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('H'),
            ),
          ),
          Chip(
            label: Text('Baby'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('B'),
            ),
          ),
          Chip(
            label: Text('Dogggg'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('D'),
            ),
          ),
          Chip(
            label: Text('Iloveyou'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('I'),
            ),
          ),
        ],
      ),
    );
  }
}
