import 'package:flutter/material.dart';

class AnimationDelayEx extends StatefulWidget {
  @override
  _AnimationDelayExState createState() => _AnimationDelayExState();
}

class _AnimationDelayExState extends State<AnimationDelayEx>
    with SingleTickerProviderStateMixin {
  // Animation _animation;
  Animation _delayedAnimation1;
  Animation _delayedAnimation2;
  AnimationController _animationController;

  List<String> _quizOptionList = [
    "Option One",
    "Option Two",
    "Option Three",
    "Option Four"
  ];

  List<String> _quizOption = ["A", "B", "C", "D"];

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    // _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
    //     parent: _animationController, curve: Curves.fastOutSlowIn));
    _delayedAnimation1 = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn)));
    _delayedAnimation2 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn)));

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    _animationController.forward();
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Quiz Quiz"),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'What is the Right Option?',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _quizOptionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index.isEven) {
                      return Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Transform(
                          transform: Matrix4.translationValues(
                              _delayedAnimation1.value * _width, 0, 0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(_quizOption[index]),
                            ),
                            title: Text(_quizOptionList[index]),
                            onTap: () {},
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Transform(
                        transform: Matrix4.translationValues(
                            _delayedAnimation2.value * _width, 0, 0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(_quizOption[index]),
                          ),
                          title: Text(_quizOptionList[index]),
                          onTap: () {},
                        ),
                      ),
                    );
                  },
                ),
                // Transform(
                //   transform: Matrix4.translationValues(
                //       _delayedAnimation1.value * _width, 0, 0),
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       child: Text(_quizOption[0]),
                //     ),
                //     title: Text(_quizOptionList[0]),
                //     onTap: () {},
                //   ),
                // ),
                // Transform(
                //   transform: Matrix4.translationValues(
                //       _delayedAnimation2.value * _width, 0, 0),
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       child: Text(_quizOption[1]),
                //     ),
                //     title: Text(_quizOptionList[1]),
                //     onTap: () {},
                //   ),
                // ),
                // Transform(
                //   transform: Matrix4.translationValues(
                //       _delayedAnimation1.value * _width, 0, 0),
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       child: Text(_quizOption[2]),
                //     ),
                //     title: Text(_quizOptionList[2]),
                //     onTap: () {},
                //   ),
                // ),
                // Transform(
                //   transform: Matrix4.translationValues(
                //       _delayedAnimation2.value * _width, 0, 0),
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       child: Text(_quizOption[3]),
                //     ),
                //     title: Text(_quizOptionList[3]),
                //     onTap: () {},
                //   ),
                // ),
              ],
            ),
          );
        });
  }
}
