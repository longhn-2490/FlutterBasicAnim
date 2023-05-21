import 'package:flutter/material.dart';

class AnimatedAlignment extends StatefulWidget {
  @override
  _AnimatedAlignmentState createState() =>
      _AnimatedAlignmentState();
}

class _AnimatedAlignmentState
    extends State<AnimatedAlignment> {
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
              alignment: _isInitialValue ? Alignment(-1, -1) : Alignment(0,0),
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
