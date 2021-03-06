import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class DelayedDisplayAnimation extends StatefulWidget {
  @override
  _DelayedDisplayAnimationState createState() =>
      _DelayedDisplayAnimationState();
}

class _DelayedDisplayAnimationState extends State<DelayedDisplayAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                    padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "QuiZ QuiZ",
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
            DelayedDisplay(
              delay: Duration(milliseconds: 50),
              slidingBeginOffset: const Offset(0, -1),
              //fadingDuration: ,
              //slidingCurve: Curves.fastOutSlowIn,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'What is the Right Option?',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DelayedDisplay(
                delay: Duration(milliseconds: 100),
                slidingBeginOffset: const Offset(-1, 0),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 20,
                              child: Text(
                                "A",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              backgroundColor: Colors.indigo,
                            ),
                          ),
                          title: Text(
                            "Option One",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 0.0,
                        color: Colors.indigo,
                        splashColor: Colors.indigoAccent,
                        highlightColor: Colors.indigoAccent[800],
                        height: 40.0,
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            DelayedDisplay(
                delay: Duration(milliseconds: 150),
                slidingBeginOffset: const Offset(1, 0),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 20,
                              child: Text(
                                "A",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              backgroundColor: Colors.indigo,
                            ),
                          ),
                          title: Text(
                            "Option One",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 0.0,
                        color: Colors.indigo,
                        splashColor: Colors.indigoAccent,
                        highlightColor: Colors.indigoAccent[800],
                        height: 40.0,
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            DelayedDisplay(
                delay: Duration(milliseconds: 200),
                slidingBeginOffset: const Offset(-1, 0),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 20,
                              child: Text(
                                "A",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              backgroundColor: Colors.indigo,
                            ),
                          ),
                          title: Text(
                            "Option One",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 0.0,
                        color: Colors.indigo,
                        splashColor: Colors.indigoAccent,
                        highlightColor: Colors.indigoAccent[800],
                        height: 40.0,
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            DelayedDisplay(
                delay: Duration(milliseconds: 250),
                slidingBeginOffset: const Offset(0, 2),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 20,
                              child: Text(
                                "A",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              backgroundColor: Colors.indigo,
                            ),
                          ),
                          title: Text(
                            "Option One",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 0.0,
                        color: Colors.indigo,
                        splashColor: Colors.indigoAccent,
                        highlightColor: Colors.indigoAccent[800],
                        height: 40.0,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
