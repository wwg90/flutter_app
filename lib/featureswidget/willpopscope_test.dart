import 'package:flutter/material.dart';

class WillPopScopeWTest extends StatefulWidget {
  @override
  _WillPopScopeWTestState createState() => _WillPopScopeWTestState();
}

class _WillPopScopeWTestState extends State<WillPopScopeWTest> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('退出功能测试'),
      ),
      body: WillPopScope(
          child: Container(
            alignment: Alignment.center,
            child: Text('1秒内连续按两次返回键退出'),
          ),
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          }),
    );
  }
}
