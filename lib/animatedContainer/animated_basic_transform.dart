import 'package:flutter/material.dart';

class AnimatedTransform1 extends StatefulWidget {
  @override
  _AnimatedTransform1State createState() =>
      _AnimatedTransform1State();
}

class _AnimatedTransform1State
    extends State<AnimatedTransform1> {
  bool _isInitialValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(

              duration: const Duration(
                seconds: 2,
              ),
              color:  Colors.red,
              child: Column(
                children: [
                  Transform.rotate(
                      angle: _isInitialValue ? 0.5 : 1.0,
                      origin: Offset(50.0,50.0),
                      child:  Container(color: Colors.blue,  width: 100, height: 100)),
                  SizedBox(height: 10,),
                  Transform.scale(
                      scale: _isInitialValue ? 0.5 : 1.0,
                      origin: Offset(50.0,50.0),
                      child:  Container(color: Colors.orange,  width: 100, height: 100)),
                  Transform.translate(
                      offset:_isInitialValue ? Offset(100.0,0.0) : Offset(0.0,0.0),
                      child:  Container(color: Colors.yellow,  width: 100, height: 100)),

                  Transform(
                    transform: Matrix4.skewY(0.3)..rotateZ(3.14 / 12.0),
                    origin: Offset(50.0, 50.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
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
