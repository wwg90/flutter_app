import 'package:flutter/material.dart';

class FormWTest extends StatefulWidget {
  @override
  _FormWTestState createState() => _FormWTestState();
}

class _FormWTestState extends State<FormWTest> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form表单示例'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                    icon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : '用户名不能为空';
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '登录密码',
                      icon: Icon(Icons.lock)),
                  validator: (v) {
                    return v.trim().length > 5 ? null : '密码不能少于6位';
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: [
                      Expanded(child: Builder(builder: (context) {
                        return RaisedButton(
                          onPressed: () {
                            //在这里不能通过此方式获取FormState，context不对
                            //print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if (Form.of(context).validate()) {
                              //验证通过提交数据
                            }
                          },
                          padding: const EdgeInsets.all(5.0),
                          child: Text('登录'),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        );
                      })),
                    ],
                  ),
                )
              ],
            ),
            key: _formKey,
            autovalidate: true,
          )),
    );
  }
}
