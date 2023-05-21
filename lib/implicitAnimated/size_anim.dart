import 'package:flutter/material.dart';

class SizeAnim extends StatefulWidget {
  @override
  _SizeAnimState createState() => _SizeAnimState();
}

class _SizeAnimState extends State<SizeAnim> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Center(
        child: SizeTransition(
          sizeFactor: _animation,
          axis: Axis.horizontal,
          axisAlignment: 0,
          child: Center(
            child: FlutterLogo(
              size: 150.0,
            ),
          ),
        ),
      ),
    );
  }
}
