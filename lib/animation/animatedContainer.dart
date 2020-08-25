import 'package:flutter/material.dart';

class AnimatedContainerEx extends StatefulWidget {
  @override
  _AnimatedContainerExState createState() => _AnimatedContainerExState();
}

class _AnimatedContainerExState extends State<AnimatedContainerEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('AnimatedContainer'),
        ),
      ),
    );
  }
}
