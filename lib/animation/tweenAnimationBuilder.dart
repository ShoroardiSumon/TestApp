import 'package:flutter/material.dart';

class TweenAnimationBuilserEx extends StatefulWidget {
  @override
  _TweenAnimationBuilserExState createState() =>
      _TweenAnimationBuilserExState();
}

class _TweenAnimationBuilserExState extends State<TweenAnimationBuilserEx> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation Builder'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          isTrue
              ? TweenAnimationBuilder(
                  child: Text(
                    "Tween",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(microseconds: 2000),
                  builder: (BuildContext context, double _val, Widget child) {
                    return Opacity(
                      opacity: _val,
                      child: Padding(
                        padding: EdgeInsets.only(top: _val * 30),
                        child: child,
                      ),
                    );
                  },
                )
              : Container(),
          SizedBox(height: 30),
          RaisedButton(
              color: Colors.green,
              child: Text(
                'Animate!',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  isTrue = true;
                });
              }),
        ],
      ),
    );
  }
}
