import 'package:flutter/material.dart';

class LoginWTest extends StatefulWidget {
  @override
  _LoginWTestState createState() => _LoginWTestState();
}

class _LoginWTestState extends State<LoginWTest> {
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController.addListener(() {
      print(_editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField示例'),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            controller: _editingController,
            decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            onChanged: (value) {
              print('pwd: $value');
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: '密码',
                hintText: '登陆密码',
                prefixIcon: Icon(Icons.lock)),
          ),
          TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮件地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none //隐藏下划线
                  )),
        ],
      ),
    );
  }
}
