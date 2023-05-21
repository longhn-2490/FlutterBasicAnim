import 'package:flutter/material.dart';

class AnimatedMargin1 extends StatefulWidget {
  @override
  AnimatedMargin1State createState() =>
      AnimatedMargin1State();
}

class AnimatedMargin1State
    extends State<AnimatedMargin1> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 150, width: 30, color: Colors.blue,),
                AnimatedContainer(
                  duration: const Duration(
                    seconds: 2,
                  ),
                  width: 100,
                  height: 100,
                  color:  Colors.red,
                  margin: EdgeInsets.symmetric(horizontal: _isInitialValue ? 0 : 20),
                  child: Text("Long", style: TextStyle(color: Colors.white),),
                ),
                Container(height: 150, width: 30, color: Colors.blue,),
              ],
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
