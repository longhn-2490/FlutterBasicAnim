import 'package:flutter/material.dart';

class MonitoringAnimation extends StatefulWidget {
  const MonitoringAnimation({Key? key}) : super(key: key);

  @override
  _MonitoringAnimationState createState() => _MonitoringAnimationState();
}

class _MonitoringAnimationState extends State<MonitoringAnimation>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //print('parent đa đc called');
    return AnimatedLogo(animation: animation);
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    Key? key,
    required this.animation,
  }) : super(key: key, listenable: animation);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
   // print('Ta đa đc called');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: animation.value,
            width: animation.value,
            child: FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
