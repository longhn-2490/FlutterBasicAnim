import 'package:flutter/material.dart';

class ScaleAnim extends StatefulWidget {
  @override
  _ScaleAnimState createState() => _ScaleAnimState();
}

class _ScaleAnimState extends State<ScaleAnim> with TickerProviderStateMixin {
  bool selected = false;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

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
        child: ScaleTransition(
          scale: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 150.0,
            ),
          ),
        ),
      ),
    );
  }
}
