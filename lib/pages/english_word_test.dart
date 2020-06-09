import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三方包测试'),
      ),
      body: Center(
        child: Column(
          children: [
            RandomWord(),
            RandomWord(),
            RandomWord(),
            RandomWord(),
            RandomWord(),
            RandomWord(),
          ],
        ),
      )
    );
  }
}

class RandomWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}