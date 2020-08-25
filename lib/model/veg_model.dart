// To parse this JSON data, do
//
//     final vegModel = vegModelFromJson(jsonString);

import 'dart:convert';

List<VegModel> vegModelFromJson(String str) => List<VegModel>.from(json.decode(str).map((x) => VegModel.fromJson(x)));

String vegModelToJson(List<VegModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VegModel {
    VegModel({
        this.name,
        this.photo,
    });

    String name;
    String photo;

    factory VegModel.fromJson(Map<String, dynamic> json) => VegModel(
        name: json["name"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
    };
}
