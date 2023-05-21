import 'package:flutter/material.dart';

class AnimatedConstraint extends StatefulWidget {
  @override
  _AnimatedConstraintState createState() =>
      _AnimatedConstraintState();
}

class _AnimatedConstraintState
    extends State<AnimatedConstraint> {
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
              constraints: BoxConstraints(
                maxWidth: _isInitialValue ? 200 : 150,
                maxHeight: _isInitialValue ? 200 : 150,
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
