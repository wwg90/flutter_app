import 'package:flutter/material.dart';
import 'drawer_test.dart';

class ScaffoldWTest extends StatefulWidget {
  @override
  _ScaffoldWTestState createState() => _ScaffoldWTestState();
}

class _ScaffoldWTestState extends State<ScaffoldWTest>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 1;

  TabController _tabController;
  List tabs = ['新闻', '历史', '娱乐'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        bottom: TabBar(
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 5));
          }).toList()),
      drawer: DrawerWTest(),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('school')),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplay), title: Text('airplay')),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),

//      bottomNavigationBar: BottomAppBar(
//        color: Colors.white,
//        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
//        child: Row(
//          children: [
//            IconButton(icon: Icon(Icons.home)),
//            SizedBox(), //中间位置空出
//            IconButton(icon: Icon(Icons.business)),
//          ],
//          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
//        ),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onAdd() {}
}
