import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleAnimationController extends StatefulWidget {
  const SimpleAnimationController({Key? key}) : super(key: key);

  @override
  _SimpleAnimationControllerState createState() =>
      _SimpleAnimationControllerState();
}

class _SimpleAnimationControllerState extends State<SimpleAnimationController>
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
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);

    animation = Tween<double>(begin: 0, end: 300).animate(controller)
    ..addListener(() async {
      await Future.delayed(Duration(seconds: 4));
      setState(() {
      });
    });

    colorAnimation = ColorTween(begin: Colors.white, end: Colors.orange).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });

    curveAnimation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    alpha = IntTween(begin: 0, end: 1).animate(curveAnimation);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 20,),
          Icon(Icons.add_circle, size: 30, color: colorAnimation.value,),
          SizedBox(height: 20,),
          Container(height: 100,
          width: 100,
          color: Colors.yellow.withOpacity(alpha.value.toDouble()),)
        ],

      ),
    );
  }
}
