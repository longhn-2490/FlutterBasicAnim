import 'package:flutter/material.dart';

class AnimatedPositioned1 extends StatefulWidget {
  @override
  _AnimatedPositioned1State createState() => _AnimatedPositioned1State();
}

class _AnimatedPositioned1State extends State<AnimatedPositioned1> {
  bool selected = false;
  bool isShowMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Center(
        child: Container(
          color: Colors.red,

          child: Stack(
            children: [
              Positioned(

                  left: 0.0, right: 0.0, top: 10, bottom: 0, child: Align(
                alignment: Alignment.center,
                  child: Text("Hide me"))),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                bottom: isShowMessage ? 100 : 0,
                top: 0,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isShowMessage = !isShowMessage;
                        });
                      },
                      child: Text('Go go go')),
                ),
              ),
              AnimatedPositioned(
                  bottom: 0,
                  width: selected ? 200 : 50,
                  height: selected ? 50 : 200,
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text('Tap me'),
                      ),
                    ),
                  ),
                  duration: Duration(seconds: 2))
            ],
          ),
        ),
      ),
    );
  }
}
