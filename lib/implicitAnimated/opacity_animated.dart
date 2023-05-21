import 'dart:math';

import 'package:flutter/material.dart';

const owl_url = 'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class FadeInDemo extends StatefulWidget {
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Image.network(owl_url),
        TextButton(
          child: Text(
            'Show details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: ()  {
            setState(() {
              opacity = Random().nextDouble();

            });
          },
        ),
        AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: opacity,
          child: Column(
            children: <Widget>[
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        )
      ]),
    );
  }
}


