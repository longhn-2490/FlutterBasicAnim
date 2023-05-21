import 'package:flutter/material.dart';
import 'package:flutter_animation/animatedContainer/animated_alignment.dart';
import 'package:flutter_animation/animatedContainer/animated_basic_transform.dart';
import 'package:flutter_animation/animatedContainer/animated_callback.dart';
import 'package:flutter_animation/animatedContainer/animated_constraint.dart';
import 'package:flutter_animation/animatedContainer/animated_container_change_color.dart';
import 'package:flutter_animation/animatedContainer/animated_decoration.dart';
import 'package:flutter_animation/animatedContainer/animated_margin.dart';
import 'package:flutter_animation/animatedContainer/animated_mixin.dart';
import 'package:flutter_animation/animatedContainer/animated_padding.dart';
import 'package:flutter_animation/animatedContainer/animated_transform.dart';
import 'package:flutter_animation/explicitAn/animatedWidget.dart';
import 'package:flutter_animation/explicitAn/animationBuilder.dart';
import 'package:flutter_animation/explicitAn/monitor_animation.dart';
import 'package:flutter_animation/explicitAn/simple_animation_controller.dart';
import 'package:flutter_animation/explicitAn/simu_animation.dart';
import 'package:flutter_animation/explicitAn/tweenAnimationBuilder.dart';
import 'package:flutter_animation/heroAnimation/basic.dart';
import 'package:flutter_animation/implicitAnimated/scale_anim.dart';
import 'package:flutter_animation/implicitAnimated/animated_align.dart';
import 'package:flutter_animation/implicitAnimated/animated_padding.dart';
import 'package:flutter_animation/implicitAnimated/animated_positioned.dart';
import 'package:flutter_animation/implicitAnimated/opacity_animated.dart';

import 'animatedContainer/animated_container_change_width.dart';
import 'animatedContainer/animated_curve.dart';
import 'heroAnimation/basic_radius.dart';
import 'implicitAnimated/size_anim.dart';
import 'implicitAnimated/slide_anim.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedPadding2(),
    );
  }
}
