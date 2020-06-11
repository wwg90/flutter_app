import 'package:flutter/material.dart';

import 'listwidget/singlechildscrollview_test.dart';
import 'listwidget/listview_one_test.dart';
import 'listwidget/listview_two_test.dart';
import 'listwidget/listview_three_test.dart';
import 'listwidget/listview_infinite_test.dart';

void main() {
  runApp(MaterialApp(
    title: 'flutter study',
    debugShowCheckedModeBanner: false,
    home: InfiniteListViewWTest(),
  ));
}
