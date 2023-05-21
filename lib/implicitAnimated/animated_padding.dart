import 'package:flutter/material.dart';

class AnimatedPadding2 extends StatefulWidget {
  @override
  _AnimatedPadding2State createState() =>
      _AnimatedPadding2State();
}

class _AnimatedPadding2State
    extends State<AnimatedPadding2> {
    bool selected = false;
    double padValue = 0.0;

    void updatePadding(double value) {
      setState(() {
        padValue = value;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              color: Colors.blue,
          ),),
          Text('Padding: $padValue'),
          ElevatedButton(
              child: const Text('Change padding'),
              onPressed: (){
                updatePadding(padValue == 0.0 ? 100.0 : 0.0);
              },
         )
        ],
      ),
    );
  }
}
