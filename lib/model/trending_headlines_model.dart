// To parse this JSON data, do
//
//     final trendingHeadlinesModel = trendingHeadlinesModelFromJson(jsonString);

import 'dart:convert';

TrendingHeadlinesModel trendingHeadlinesModelFromJson(String str) =>
    TrendingHeadlinesModel.fromJson(json.decode(str));

class TrendingHeadlinesModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  TrendingHeadlinesModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory TrendingHeadlinesModel.fromJson(Map<String, dynamic> json) =>
      TrendingHeadlinesModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );
}

class Article {
  Source? source;
  dynamic author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Source {
  dynamic id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
