import 'package:flutter/material.dart';

class SlideAnim extends StatefulWidget {
  @override
  _SlideAnimState createState() => _SlideAnimState();
}

class _SlideAnimState extends State<SlideAnim> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(1.0, 0.0)).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

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
        child: SlideTransition(
          position: _offsetAnimation,
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
