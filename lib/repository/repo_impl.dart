import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/repository/repo.dart';

import '../model/constant.dart';
import '../model/newsResponse.dart';
import '../model/source_response.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<SourcesResponse> getSource(String catId) async {
    Uri uri = Uri.https(Constant.BASE_URL, '/v2/top-headlines/sources', {
      "apiKey": Constant.API_KEY,
      "category": catId,
    });
    http.Response response = await http.get(uri);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<NewsResponse> getNews(String sourceId) async {
    Uri uri = Uri.https(Constant.BASE_URL, '/v2/everything', {
      "apiKey": Constant.API_KEY,
      "sources": sourceId,
    });
    http.Response response = await http.get(uri);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<NewsResponse> getSearchNews(String q) async {
    Uri uri = Uri.https(Constant.BASE_URL, '/v2/everything', {
      "q": q,
      "apiKey": Constant.API_KEY,
    });

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch search results");
    }
  }
}
