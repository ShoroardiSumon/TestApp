import 'package:flutter/cupertino.dart';
import 'package:test_app/model/quiz_model.dart';
import 'package:test_app/model/todoEx.dart';
import 'package:test_app/model/vegModelEx.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProData extends ChangeNotifier {
  var value = "Vegitables";

  // if {"json": "data"} this type of jason, then parse the json like this assest as well as from api
  VegModelEx vegModelEx;

  Future<VegModelEx> fetchData() async {
    final response = await rootBundle.loadString("assets/data_ex.json");
    vegModelEx = vegModelExFromJson(response);
    print(vegModelEx.data.vagitables[0].name);
    return vegModelEx;
  }

  // if JSON data [{},{},{}]

  List<QuizModel> quizModelList;
  Future<String> fetchQuizQuestion() async {
    final response = await rootBundle.loadString('assets/quiz_demo.json');
    quizModelList = quizModelFromJson(response);
    print(quizModelList[0].answer);
    return quizModelList.toString();
  }

  // if [ "json" : "data" ] this type of json , then do this for parse json data
  List<ToDo> toDoList;
  List<ToDo> toDoFromJson(String str) =>
      List<ToDo>.from(json.decode(str).map((x) => ToDo.fromJson(x)));

  Future<String> fetchToDo() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/todos");
    toDoList = toDoFromJson(response.body.toString());
    print(toDoList.length);
    return "success";
  }

  Future<bool> loadMoreLM() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    fetchToDo();
    return true;
  }

  Future<void> refreshLM() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    fetchToDo();
  }
}
