// To parse this JSON data, do
//
//     final sourceModel = sourceModelFromJson(jsonString);

import 'dart:convert';

SourceModel sourceModelFromJson(String str) =>
    SourceModel.fromJson(json.decode(str));

class SourceModel {
  String? status;
  List<Sources>? sources;

  SourceModel({
    this.status,
    this.sources,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        status: json["status"],
        sources: json["sources"] == null
            ? []
            : List<Sources>.from(
                json["sources"]!.map((x) => Sources.fromJson(x))),
      );
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );
}
