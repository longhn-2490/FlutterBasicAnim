import 'package:flutter/material.dart';

class AnimatedPadding1 extends StatefulWidget {
  @override
  _AnimatedPaddingState createState() =>
      _AnimatedPaddingState();
}

class _AnimatedPaddingState
    extends State<AnimatedPadding1> {
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
              color:  Colors.red,
              padding: EdgeInsets.all(_isInitialValue ? 0 : 30),
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
