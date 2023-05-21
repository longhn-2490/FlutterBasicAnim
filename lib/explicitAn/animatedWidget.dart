import 'package:flutter/material.dart';

class SimpleAnimatedWidget extends StatefulWidget {
  const SimpleAnimatedWidget({Key? key}) : super(key: key);

  @override
  _SimpleAnimatedWidgetState createState() =>
      _SimpleAnimatedWidgetState();
}

class _SimpleAnimatedWidgetState extends State<SimpleAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late  final Animation<double> animation;
  late  final Animation<Color?> colorAnimation;
  late  final Animation<double> curveAnimation;
  late  final Animation<int> alpha;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = Tween<double>(begin: 0, end: 300).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print('parent đa đc called');
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
    print('Ta đa đc called');
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
