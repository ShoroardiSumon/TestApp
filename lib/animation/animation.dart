import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test_app/animation/animatedContainer.dart';
import 'package:test_app/animation/animationTween.dart';
import 'package:test_app/animation/delayedAnimation.dart';
import 'package:test_app/animation/delayed_animation.dart';
import 'package:test_app/animation/delayed_display_animation.dart.dart';
import 'package:test_app/animation/tweenAnimationBuilder.dart';

class AnimationHome extends StatefulWidget {
  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> {
  List<String> _animationCategoryList = [
    "Animated Container",
    "Animation Tween",
    "Tween Animation Builder",
    "Delayed Animation",
    "Animation Delay EX",
    "Delayed Display Animation",
    "Animation Tween",
    "Animated Container",
    "Tween Animation Builder",
    "Delayed Animation",
    "Animation Delay EX",
    "Delayed Display Animation",
    "Animation Tween",
    "Animated Container",
    "Tween Animation Builder",
    "Delayed Animation",
    "Animation Delay EX",
    "Delayed Display Animation",
  ];

  List<Widget> _animationWidgetList = [
    AnimatedContainerEx(),
    AnimationTween(),
    TweenAnimationBuilserEx(),
    DelayedAnimationEx(),
    AnimationDelayEx(),
    DelayedDisplayAnimation(),
    AnimatedContainerEx(),
    AnimationTween(),
    TweenAnimationBuilserEx(),
    DelayedAnimationEx(),
    AnimationDelayEx(),
    DelayedDisplayAnimation(),
    AnimatedContainerEx(),
    AnimationTween(),
    TweenAnimationBuilserEx(),
    DelayedAnimationEx(),
    AnimationDelayEx(),
    DelayedDisplayAnimation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
        centerTitle: true,
      ),
      body: Container(
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: _animationCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                      verticalOffset: 100,
                      child: FadeInAnimation(
                          child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(_createRoute(_animationWidgetList[index]));
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(_animationCategoryList[index][0]),
                            ),
                            title: Text(_animationCategoryList[index]),
                          ),
                        ),
                      ))));
            },
          ),
        ),
      ),
    );
  }

  Route _createRoute(Widget _page) {
    return PageRouteBuilder(
      fullscreenDialog: true,
      pageBuilder: (context, animation, secondaryAnimation) => _page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: Offset(1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.ease));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 400),
    );
  }
}
