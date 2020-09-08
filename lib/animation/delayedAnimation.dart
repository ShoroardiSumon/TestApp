import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DelayedAnimationEx extends StatefulWidget {
  @override
  _DelayedAnimationExState createState() => _DelayedAnimationExState();
}

class _DelayedAnimationExState extends State<DelayedAnimationEx>
    with SingleTickerProviderStateMixin {
  //Animation _animation;
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
    _animationController.forward();
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: false,
                    elevation: 0,
                    backgroundColor: Color(0xFFefeff1),
                    expandedHeight: 100,
                    automaticallyImplyLeading: false,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, right: 10),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Quiz Quiz",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ];
              },
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
                  _quizOptionAnimation(_delayedAnimation1, _delayedAnimation2),
                ],
              ),
            ),
          );
        });
  }

  Widget _quizOptionAnimation(var _delayedAnimation1, var _delayedAnimation2) {
    final double _width = MediaQuery.of(context).size.width;

    return ListView.builder(
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
    );
  }
}
