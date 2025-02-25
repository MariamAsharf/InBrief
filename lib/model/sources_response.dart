import 'package:hive/hive.dart';

part 'sources_response.g.dart';

@HiveType(typeId: 0)
class SourcesResponse {
  @HiveField(0)
  String? status;

  @HiveField(1)
  String? code;

  @HiveField(2)
  String? message;

  @HiveField(3)
  List<Sources>? sources;

  SourcesResponse({this.status, this.sources, this.code, this.message});

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      sources: (json['sources'] as List?)?.map((v) => Sources.fromJson(v)).toList(),
    );
  }
}

@HiveType(typeId: 1)
class Sources {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? language;

  @HiveField(6)
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

  factory Sources.fromJson(Map<String, dynamic> json) {
    return Sources(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
      language: json['language'],
      country: json['country'],
    );
  }
}
