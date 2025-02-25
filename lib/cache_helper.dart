import 'package:hive/hive.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sources_response.dart';

class HiveServices {
  static const String sourceBox = "SourceBox1";
  static const String newsBox = "NewsBox1";

  static Future<Box<SourcesResponse>> _openBox() async {
    if (!Hive.isBoxOpen(sourceBox)) {
      return await Hive.openBox<SourcesResponse>(sourceBox);
    }
    return Hive.box<SourcesResponse>(sourceBox);
  }

  static Future<void> saveSourceResponse(SourcesResponse source) async {
    var box = await _openBox();
    box.put("SourceResponse", source);
  }

  static Future<SourcesResponse> getSourceResponse() async {
    var box = await _openBox();
    SourcesResponse? sourceResponse = box.get("SourceResponse");
    return sourceResponse ?? SourcesResponse();
  }

  static Future<void> deleteSourceResponse() async {
    var box = await _openBox();
    box.delete("SourceResponse");
  }

  static Future<Box<NewsResponse>> _openNewsBox() async {
    if (!Hive.isBoxOpen(newsBox)) {
      return await Hive.openBox<NewsResponse>(newsBox);
    }
    return Hive.box<NewsResponse>(newsBox);
  }

  static Future<void> saveNewsResponse(NewsResponse news) async {
    var box = await _openNewsBox();
    box.put("NewsResponse", news);
  }

  static Future<NewsResponse> getNewsResponse() async {
    var box = await _openNewsBox();
    NewsResponse? newsResponse = box.get("NewsResponse");
    return newsResponse ?? NewsResponse();
  }

  static Future<void> deleteNewsResponse() async {
    var box = await _openNewsBox();
    box.delete("NewsResponse");
  }
}
