// To parse this JSON data, do
//
//     final vegModelEx = vegModelExFromJson(jsonString);

import 'dart:convert';

VegModelEx vegModelExFromJson(String str) =>
    VegModelEx.fromJson(json.decode(str));

String vegModelExToJson(VegModelEx data) => json.encode(data.toJson());

class VegModelEx {
  VegModelEx({
    this.data,
  });

  Data data;

  factory VegModelEx.fromJson(Map<String, dynamic> json) => VegModelEx(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.vagitables,
  });

  List<Vagitable> vagitables;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        vagitables: List<Vagitable>.from(
            json["vagitables"].map((x) => Vagitable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vagitables": List<dynamic>.from(vagitables.map((x) => x.toJson())),
      };
}

class Vagitable {
  Vagitable({
    this.name,
    this.photo,
  });

  String name;
  String photo;

  factory Vagitable.fromJson(Map<String, dynamic> json) => Vagitable(
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
      };
}
