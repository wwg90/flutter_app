import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小姐姐电话'),
      ),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {_navigateToXJJ(context);},
      child: Text('去找小姐姐'),
    );
  }

  _navigateToXJJ(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => XiaoJj()));

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$result'),
    ));
  }
}

class XiaoJj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('i am xiaojiejie')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, '大长腿15899990000');
              },
              child: Text('大长腿小姐姐'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, '大boba15899990000');
              },
              child: Text('大boba小姐姐'),
            ),
          ],
        ),
      ),
    );
  }
}