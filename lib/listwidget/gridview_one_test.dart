import 'package:flutter/material.dart';

class GridViewOneWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView布局示例'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        children: [
          Icon(Icons.airplay),
          Icon(Icons.airport_shuttle),
          Icon(Icons.home),
          Icon(Icons.beach_access),
          Icon(Icons.directions_bike),
          Icon(Icons.bubble_chart)
        ],
      ),
    );
  }
}
