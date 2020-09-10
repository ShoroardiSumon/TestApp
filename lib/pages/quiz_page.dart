import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/constants.dart';
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
      backgroundColor: Color(0xFFefeff1),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Color(0xFFefeff1),
              expandedHeight: 150,
              automaticallyImplyLeading: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                title: Text(
                  "QuiZ QuiZ",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                // background: Padding(
                //   padding: EdgeInsets.all(8),
                //   child: Text('back'),
                // ),

                //background: Image.asset(ImageStore.carrot, fit: BoxFit.cover,),
                // centerTitle: true,
                // title: Container(
                //   height: 100,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: _quizSubjectList.length,
                //     itemBuilder: (BuildContext context, int index) {
                //     return InkWell(
                //       onTap: (){},
                //       child: Card(
                //         child: Container(
                //           alignment: Alignment.center,
                //           height: 100,
                //           width: 100,
                //           child: Text("data", style: TextStyle(color: Colors.black),),
                //         ),
                //       ),
                //     );
                //    },
                //   ),
                // ),

                background: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome to",
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
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )
          ),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DelayedDisplay(
                    delay: Duration(milliseconds: 50),
                    slidingBeginOffset: const Offset(0, -1),
                    //fadingDuration: ,
                    //slidingCurve: Curves.fastOutSlowIn,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
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
                                showAlertDialog(context);
                              },
                              child: ListTile(
                                title: Text(
                                  "C Programming",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
                    height: 5,
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
                                showAlertDialog(context);
                              },
                              child: ListTile(
                                title: Text(
                                  "Dart",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
                    height: 5,
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
                                showAlertDialog(context);
                              },
                              child: ListTile(
                                title: Text(
                                  "Flutter",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
                    height: 5,
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
                                showAlertDialog(context);
                              },
                              child: ListTile(
                                title: Text(
                                  "JAVA",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
                    height: 5,
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
                                showAlertDialog(context);
                              },
                              child: ListTile(
                                title: Text(
                                  "Python",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
                    height: 5,
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
                                showAlertDialog(context);
                              },
                              child: ListTile(
                                title: Text(
                                  "JavaScript",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        child: CupertinoAlertDialog(
          title: Text("Quiz"),
          content: Text("Are you ready to start Quiz?"),
          actions: <Widget>[
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back")),
            CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.green),
                isDefaultAction: true,
                onPressed: () async {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => QuizStart()));
                },
                child: Text("Start")),
          ],
        ));
  }
}
