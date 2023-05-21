import 'package:flutter/material.dart';

class AnimatedTransform extends StatefulWidget {
  @override
  _AnimatedTransformState createState() => _AnimatedTransformState();
}

class _AnimatedTransformState extends State<AnimatedTransform> {
  bool _isInitialValue = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              transform: _isInitialValue
                  ? (Matrix4.identity()
                    ..translate(0.1,-size.height)
                    ..scale(0.5, 0.5))
                  : Matrix4.identity(),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10)),
              ),
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
