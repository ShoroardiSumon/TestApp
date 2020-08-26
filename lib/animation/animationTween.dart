import 'package:flutter/material.dart';

class AnimationTween extends StatefulWidget {
  @override
  _AnimationTweenState createState() => _AnimationTweenState();
}

class _AnimationTweenState extends State<AnimationTween>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  Animation _curves;
  bool isFav = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _curves =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curves);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 20, end: 100),
        weight: 100,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 100, end: 20),
        weight: 100,
      ),
    ]).animate(_curves);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Tween'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: AnimatedBuilder(
              animation: _curves,
              builder: (BuildContext context, _) {
                return IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _colorAnimation.value,
                    size: _sizeAnimation.value,
                  ),
                  onPressed: () {
                    isFav
                        ? _animationController.reverse()
                        : _animationController.forward();
                  },
                );
              }),
        ),
      ),
    );
  }
}
