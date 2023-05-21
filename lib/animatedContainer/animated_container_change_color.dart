import 'package:flutter/material.dart';

class AnimatedContainerChangeColor extends StatefulWidget {
  @override
  _AnimatedContainerChangeColorState createState() =>
      _AnimatedContainerChangeColorState();
}

class _AnimatedContainerChangeColorState
    extends State<AnimatedContainerChangeColor> {
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
              color: _isInitialValue ? Colors.blue : Colors.red,
              child: const SizedBox(width: 100, height: 100,),
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
