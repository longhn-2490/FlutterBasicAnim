import 'package:flutter/material.dart';

class AnimatedCallback extends StatefulWidget {
  @override
  _AnimatedCallbackState createState() =>
      _AnimatedCallbackState();
}

class _AnimatedCallbackState
    extends State<AnimatedCallback> {
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
              child: const SizedBox(width: 300, height: 300),
              onEnd:() {
                print("changed");
              },
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
