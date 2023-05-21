import 'package:flutter/material.dart';

class SimpleAnimationBuilder extends StatefulWidget {
  const SimpleAnimationBuilder({Key? key}) : super(key: key);

  @override
  _SimpleAnimationBuilderState createState() =>
      _SimpleAnimationBuilderState();
}

class _SimpleAnimationBuilderState extends State<SimpleAnimationBuilder>
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
    return GrowTransition(child: LogoWidget(), animation: animation);
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child),
  );
}


class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}