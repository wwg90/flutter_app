import 'package:flutter/material.dart';

class InheritedWidgetWTest extends StatefulWidget {
  @override
  _InheritedWidgetWTestState createState() => _InheritedWidgetWTestState();
}

class _InheritedWidgetWTestState extends State<InheritedWidgetWTest> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据共享示例'),
      ),
      body: Center(
        child: ShareDataWidget(
          //使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _WTestChildWidget(), //子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                child: Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  final int data; //需要在子树中共享的数据，保存点击次数

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class _WTestChildWidget extends StatefulWidget {
  @override
  __WTestChildWidgetState createState() => __WTestChildWidgetState();
}

class __WTestChildWidgetState extends State<_WTestChildWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
