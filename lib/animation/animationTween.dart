import 'package:flutter/material.dart';

class AnimationTween extends StatefulWidget {
  @override
  _AnimationTweenState createState() => _AnimationTweenState();
}

class _AnimationTweenState extends State<AnimationTween> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Tween'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('Tween'),
        ),
      ),
    );
  }
}
