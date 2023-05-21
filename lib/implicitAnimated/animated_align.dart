import 'package:flutter/material.dart';

class AnimatedAlign1 extends StatefulWidget {
  @override
  _AnimatedAlignState createState() =>
      _AnimatedAlignState();
}

class _AnimatedAlignState
    extends State<AnimatedAlign1> {
    bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: Container(
            width: 250.0,
            height: 250.0,
            color: Colors.red,
            child: AnimatedAlign(
              alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 50,),
            ),
          ),
        ),
      )
    );
  }
}
