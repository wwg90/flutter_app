import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog测试'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog1(context);
                if (delete == null) {
                  print('取消删除！');
                } else {
                  print(('确认删除...'));
                }
              },
              child: Text('AlertDialog'),
            ),
            RaisedButton(
              onPressed: () {
                changeLanguage(context);
              },
              child: Text('SimpleDialog'),
            ),
            RaisedButton(
              onPressed: () {
                showListDialog(context);
              },
              child: Text('Dialog-ListView'),
            ),
            RaisedButton(
              onPressed: () {
                showCustomComfirmDialog1(context);
              },
              child: Text('Custom-AlertDialog'),
            ),
            RaisedButton(
              onPressed: () async {
                bool deleteTree = await showDeleteConfirmDialog3(context);
                if (deleteTree == null) {
                  print('取消删除！');
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
              child: Text('复选框'),
            ),
            RaisedButton(
              onPressed: () async {
                bool deleteTree = await showDeleteConfirmDialog4(context);
                if (deleteTree == null) {
                  print('取消删除！');
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
              child: Text('复选框2'),
            ),
            RaisedButton(
              child: Text("显示底部菜单列表"),
              onPressed: () async {
                int type = await _showModalBottomSheet(context);
                print(type);
              },
            ),
            RaisedButton(
              child: Text("显示加载框"),
              onPressed: () {
                showLoadingDialog(context);
              },
            ),
            RaisedButton(
              child: Text("显示日历"),
              onPressed: () {
                _showDatePicker1(context);
              },
            ),
            RaisedButton(
              child: Text("显示日历2"),
              onPressed: () {
                _showDatePicker2(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<DateTime> _showDatePicker2(BuildContext context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
    context: context,
    builder: (ctx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: date,
          maximumDate: date.add(
            Duration(days: 30),
          ),
          maximumYear: date.year + 1,
          onDateTimeChanged: (DateTime value) {
            print(value);
          },
        ),
      );
    },
  );
}

Future<DateTime> _showDatePicker1(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add(
      //未来30天可选
      Duration(days: 30),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

// 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

Future<bool> showDeleteConfirmDialog4(BuildContext context) {
  bool _withTree = false;
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                // 通过Builder来获得构建Checkbox的`context`，
                // 这是一种常用的缩小`context`范围的方式
                Builder(
                  builder: (BuildContext context) {
                    return Checkbox(
                      value: _withTree,
                      onChanged: (bool value) {
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 执行删除操作
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}

Future<bool> showDeleteConfirmDialog3(BuildContext context) {
  bool _withTree = false; //记录复选框是否选中
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                DialogCheckbox(
                  value: _withTree, //默认不选中
                  onChanged: (bool value) {
                    //更新选中状态
                    _withTree = !_withTree;
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 将选中状态返回
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
              child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          )),
        ],
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

Future<void> changeLanguage(BuildContext context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

Future<bool> showCustomComfirmDialog1(BuildContext context) {
  return showCustomDialog<bool>(
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('您确定要删除文件吗？'),
          actions: [
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        );
      },
      context: context);
}

Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showDialog<bool>(
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('您确定要删除文件吗？'),
          actions: [
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        );
      },
      context: context);
}

Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
