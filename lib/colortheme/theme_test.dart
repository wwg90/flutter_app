import 'package:flutter/material.dart';

class ThemeWTest extends StatefulWidget {
  @override
  _ThemeWTestState createState() => _ThemeWTestState();
}

class _ThemeWTestState extends State<ThemeWTest> {
  //当前路由主题色
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor), //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('主题测试'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.airplay),
                Icon(Icons.favorite),
                Text('  颜色跟随主题')
              ],
            ),
            Theme(
                data: themeData.copyWith(
                    iconTheme:
                        themeData.iconTheme.copyWith(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.airplay),
                    Icon(Icons.favorite),
                    Text('  颜色固定黑色')
                  ],
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _themeColor =
                  _themeColor == Colors.teal ? Colors.blue : Colors.teal;
            });
          },
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
