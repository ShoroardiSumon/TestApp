import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/model/quiz_model.dart';
import 'package:test_app/pages/pro_data_EX.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import 'package:test_app/pages/quiz_start.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<QuizModel> quizModelList;
  // Future<String> fetchQuizQuestion() async {
  //   final response = await rootBundle.loadString('assets/quiz_demo.json');
  //   quizModelList = quizModelFromJson(response);
  //   print(quizModelList[0].answer);
  //   return "success";
  // }

  List<String> _quizSubjectList = [
    "C Programming",
    "Dart",
    "Flutter",
    "JAVA",
    "Python",
    "JavaScript",
  ];

  int _mlliseconds = 50;

  @override
  Widget build(BuildContext context) {
    final _providerData = Provider.of<ProData>(context);
    _providerData.fetchQuizQuestion();

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
                padding: EdgeInsets.only(top: 60, left: 15, right: 15),
                child: Text(
                  'Which Subject do you want to Quiz?',
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // ListView.builder(
            //   itemCount: _quizSubjectList.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return DelayedDisplay(
            //         delay: Duration(milliseconds: _milseconds),
            //         slidingBeginOffset: const Offset(0, 1),
            //         //slidingCurve: Curves.fastOutSlowIn,
            //         child: Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: Material(
            //             color: Colors.transparent,
            //             child: Container(
            //               width: 300,
            //               child: MaterialButton(
            //                 onPressed: () {},
            //                 child: ListTile(
            //                   title: Text(
            //                     _quizSubjectList[index],
            //                     style: TextStyle(
            //                         color: Colors.white, fontSize: 25),
            //                   ),
            //                 ),
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(50)),
            //                 elevation: 0.0,
            //                 color: Colors.indigo,
            //                 splashColor: Colors.indigoAccent,
            //                 highlightColor: Colors.indigoAccent[800],
            //                 height: 40.0,
            //               ),
            //             ),
            //           ),
            //         ));
            //   },
            // ),
            DelayedDisplay(
                delay: Duration(milliseconds: 50),
                slidingBeginOffset: const Offset(0, 1),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => QuizStart()));
                        },
                        child: ListTile(
                          title: Text(
                            "C Programming",
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
                slidingBeginOffset: const Offset(0, 1),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => QuizStart()));
                        },
                        child: ListTile(
                          title: Text(
                            "Dart",
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
                delay: Duration(milliseconds: 350),
                slidingBeginOffset: const Offset(0, 1),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => QuizStart()));
                        },
                        child: ListTile(
                          title: Text(
                            "Flutter",
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
                delay: Duration(milliseconds: 500),
                slidingBeginOffset: const Offset(0, 1),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => QuizStart()));
                        },
                        child: ListTile(
                          title: Text(
                            "JAVA",
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
                delay: Duration(milliseconds: 650),
                slidingBeginOffset: const Offset(0, 1),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => QuizStart()));
                        },
                        child: ListTile(
                          title: Text(
                            "Python",
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
                delay: Duration(milliseconds: 800),
                slidingBeginOffset: const Offset(0, 1),
                //slidingCurve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => QuizStart()));
                        },
                        child: ListTile(
                          title: Text(
                            "JavaScript",
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
