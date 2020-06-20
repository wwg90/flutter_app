import 'package:flutter/material.dart';

class ScaleAnimationWTest extends StatefulWidget {
  @override
  _ScaleAnimationWTestState createState() => _ScaleAnimationWTestState();
}

class _ScaleAnimationWTestState extends State<ScaleAnimationWTest>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
//    controller = new AnimationController(
//        duration: const Duration(seconds: 3), vsync: this);
//    //图片宽高从0变到300
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
//    //启动动画
//    controller.forward();

    controller = new AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画（正向）
    controller.forward();

  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('放大动画'),
      ),
//      body: AnimatedImage(
//        animation: animation,
//      ),
      body: AnimatedBuilder(
        animation: animation,
        child: Image.asset("images/avatar.png"),
        builder: (BuildContext ctx, Widget child) {
          return new Center(
            child: Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        },
      ),
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("images/avatar.png",
          width: animation.value, height: animation.value),
    );
  }
}
