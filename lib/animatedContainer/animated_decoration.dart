import 'package:flutter/material.dart';

class AnimatedDecoration1 extends StatefulWidget {
  @override
  _AnimatedDecoration1State createState() =>
      _AnimatedDecoration1State();
}

class _AnimatedDecoration1State
    extends State<AnimatedDecoration1> {
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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: _isInitialValue ? Colors.black : Colors.blue,
                border: Border.all(width: _isInitialValue ? 0 : 10),
              ),
              child: Text("Long", style: TextStyle(color: Colors.white),),
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
