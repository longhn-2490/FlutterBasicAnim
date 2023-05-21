
import 'package:flutter/material.dart';

/// Flutter code sample for TweenAnimationBuilder

// This example shows an [IconButton] that "zooms" in when the widget first
// builds (its size smoothly increases from 0 to 24) and whenever the button
// is pressed, it smoothly changes its size to the new target value of either
// 48 or 24.

/// This is the stateful widget that the main application instantiates.
class TweenBuilderWidget extends StatefulWidget {
  const TweenBuilderWidget({Key? key}) : super(key: key);

  @override
  _TweenBuilderWidgetState createState() => _TweenBuilderWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TweenBuilderWidgetState extends State<TweenBuilderWidget> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          builder: (BuildContext context, double size, Widget? child) {
            return IconButton(
              iconSize: size,
              color: Colors.blue,
              icon: child!,
              onPressed: () {
                setState(() {
                  targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                });
              },
            );
          },
          child: const Icon(Icons.aspect_ratio),
        ),
      ),
    );
  }
}