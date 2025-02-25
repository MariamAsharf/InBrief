import 'package:hive/hive.dart';
import 'package:news_app/model/sources_response.dart';

part 'news_response.g.dart';

@HiveType(typeId: 2)
class NewsResponse {
  @HiveField(0)
  String? status;

  @HiveField(1)
  String? code;

  @HiveField(2)
  String? message;

  @HiveField(3)
  int? totalResults;

  @HiveField(4)
  List<Articles>? articles;

  NewsResponse(
      {this.status, this.totalResults, this.articles, this.message, this.code});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List?)
          ?.map((v) => Articles.fromJson(v))
          .toList(),
    );
  }
}

@HiveType(typeId: 3)
class Articles {
  @HiveField(0)
  Sources? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null ? Sources.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
