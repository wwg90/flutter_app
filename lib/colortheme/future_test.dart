import 'package:flutter/material.dart';

class FutureWTest extends StatefulWidget {
  @override
  _FutureWTestState createState() => _FutureWTestState();
}

class _FutureWTestState extends State<FutureWTest> {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future测试'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
          future: mockNetworkData(),
        ),
      ),
    );
  }
}
