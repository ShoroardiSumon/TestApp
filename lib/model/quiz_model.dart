// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

List<QuizModel> quizModelFromJson(String str) => List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

String quizModelToJson(List<QuizModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
    QuizModel({
        this.title,
        this.option,
        this.answer,
    });

    String title;
    Option option;
    String answer;

    factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        title: json["title"],
        option: Option.fromJson(json["option"]),
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "option": option.toJson(),
        "answer": answer,
    };
}

class Option {
    Option({
        this.a,
        this.b,
        this.c,
        this.d,
    });

    String a;
    String b;
    String c;
    String d;

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
    );

    Map<String, dynamic> toJson() => {
        "a": a,
        "b": b,
        "c": c,
        "d": d,
    };
}
