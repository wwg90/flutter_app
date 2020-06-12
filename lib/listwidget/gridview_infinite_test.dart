import 'package:flutter/material.dart';

class GridViewInfiniteWTest extends StatefulWidget {
  @override
  _GridViewInfiniteWTestState createState() => _GridViewInfiniteWTestState();
}

class _GridViewInfiniteWTestState extends State<GridViewInfiniteWTest> {
  List<IconData> _lists = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView布局示例'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 1.0),
          itemCount: _lists.length,
          itemBuilder: (context, index) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            if (index == _lists.length - 1 && _lists.length < 200) {
              _retrieveIcons();
            }
            return Icon(_lists[index]);
          }),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _lists.addAll([
          Icons.airplay,
          Icons.airport_shuttle,
          Icons.home,
          Icons.beach_access,
          Icons.directions_bike,
          Icons.bubble_chart
        ]);
      });
    });
  }
}
