import 'dart:async';
import 'dart:convert';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/model/quiz_model.dart';
import 'package:test_app/pages/pro_data_EX.dart';

class QuizStart extends StatefulWidget {
  @override
  _QuizStartState createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  List<QuizModel> quizData = List();

  int i = 0;
  void increase() {
    if (i <= 1) {
      setState(() {
        i += 1;
      });
    } else
      setState(() {
        i = 0;
      });
  }

  void _checkAnswer(String option, int index) {
    if (option == quizData[index].answer) {
      increase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _providerData = Provider.of<ProData>(context);
    _providerData.fetchQuizQuestion();

    List<QuizModel> quizModelFromJson(String str) => List<QuizModel>.from(
        json.decode(str).map((x) => QuizModel.fromJson(x)));

    return Scaffold(
      appBar: AppBar(
        title: Text('MCQ Question'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        //future: _providerData.fetchQuizQuestion(),
        future: DefaultAssetBundle.of(context)
            .loadString("assets/quiz_demo.json", cache: false),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          quizData.clear();
          quizData.addAll(quizModelFromJson(snapshot.data.toString()));

          return Container(
            child: Column(
              children: <Widget>[
                AbsorbPointer(
                  absorbing: false,
                  child: _question(context, i),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _question(BuildContext context, int index) {

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DelayedDisplay(
            delay: Duration(milliseconds: 50),
            slidingBeginOffset: const Offset(0, -1),
            //fadingDuration: ,
            //slidingCurve: Curves.fastOutSlowIn,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                quizData[index].title,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 30,
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
                      onPressed: () {
                        _checkAnswer(quizData[index].option.a, index);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              "A",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                        title: Text(
                          quizData[index].option.a,
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
                      onPressed: () {
                        _checkAnswer(quizData[index].option.b, index);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              "B",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                        title: Text(
                          quizData[index].option.b,
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
                      onPressed: () {
                        _checkAnswer(quizData[index].option.c, index);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              "C",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                        title: Text(
                          quizData[index].option.c,
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
                      onPressed: () {
                        _checkAnswer(quizData[index].option.d, index);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              "D",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                        title: Text(
                          quizData[index].option.d,
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
    );
  }
}
