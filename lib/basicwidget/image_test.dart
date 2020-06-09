import 'package:flutter/material.dart';

class ImageWTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String avatar = 'images/avatar.png';
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Scaffold(
      appBar: AppBar(
        title: Text('Image示例'),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(avatar),
              width: 100.0,
            ),
            Image.asset(
              avatar,
              width: 120.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Divider(),
            Image(
              image:
                  NetworkImage('https://pcdn.flutterchina.club/imgs/3-17.png'),
              width: 100.0,
            ),
            Image.network(
              'https://pcdn.flutterchina.club/imgs/3-17.png',
              width: 120.0,
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  MyIcons.cry,
                  color: Colors.purple,
                ),
                Icon(
                  MyIcons.good,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyIcons {
  static const IconData cry =
      const IconData(0xe77e, fontFamily: 'myIcon', matchTextDirection: true);

  static const IconData good =
      const IconData(0xe780, fontFamily: 'myIcon', matchTextDirection: true);
}
