import 'package:flutter/material.dart';

class AnimatedContainerChangeWidth extends StatefulWidget {
  @override
  _AnimatedContainerChangeWidthState createState() =>
      _AnimatedContainerChangeWidthState();
}

class _AnimatedContainerChangeWidthState
    extends State<AnimatedContainerChangeWidth> {
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
              color: Colors.red,
              width: _isInitialValue ? 150 : 50,
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
