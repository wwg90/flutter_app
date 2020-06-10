import 'package:flutter/material.dart';

class SwitchAndCheckBoxWTest extends StatefulWidget {
  @override
  _SwitchAndCheckBoxWTestState createState() => _SwitchAndCheckBoxWTestState();
}

class _SwitchAndCheckBoxWTestState extends State<SwitchAndCheckBoxWTest> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单选开关和复选框示例'),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                }),
            Checkbox(
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
              activeColor: Colors.red,
            )
          ],
        ),
      )
    );
  }
}
