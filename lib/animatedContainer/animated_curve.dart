import 'package:flutter/material.dart';

class AnimatedCurve extends StatefulWidget {
  @override
  _AnimatedCurveState createState() =>
      _AnimatedCurveState();
}

class _AnimatedCurveState
    extends State<AnimatedCurve> {
  bool _isInitialValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(
                seconds: 2,
              ),
              color:  Colors.red,
              width: _isInitialValue ? 100 : 50,
              curve: Curves.bounceInOut,
              child: const SizedBox(width: 300, height: 300),
            ),
            OutlinedButton(
              child: Text('Change value'),
              onPressed: () {
                setState(() {
                  _isInitialValue = !_isInitialValue;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
