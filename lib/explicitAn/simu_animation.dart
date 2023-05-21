import 'package:flutter/material.dart';

class SimulAnimation extends StatefulWidget {
  const SimulAnimation({Key? key}) : super(key: key);

  @override
  _SimulAnimationState createState() => _SimulAnimationState();
}

class _SimulAnimationState extends State<SimulAnimation>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

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
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
   // print('Ta đa đc called');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: _opacityTween.evaluate(animation),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: _sizeTween.evaluate(animation),
              width: _sizeTween.evaluate(animation),
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
