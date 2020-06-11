import 'package:flutter/material.dart';

class SingleChildScrollViewWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView示例'),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: str
                      .split("")
                      .map((e) => Text(
                            e,
                            textScaleFactor: 2.0,
                          ))
                      .toList(),
                ),
              ))),
    );
  }
}
