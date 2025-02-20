//import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:news_app/model/constant.dart';
// import 'package:news_app/model/newsResponse.dart';
// import 'package:news_app/model/source_response.dart';
//
// class ApiManager {
//   static Future<SourcesResponse> getSources(String categoryName) async {
//     Uri uri = Uri.https(Constant.BASE_URL, '/v2/top-headlines/sources',
//         {"apiKey": Constant.API_KEY, "category": categoryName});
//     http.Response response = await http.get(uri);
//     var json = jsonDecode(response.body);
//     SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
//     return sourcesResponse;
//   }
//
//   static Future<NewsResponse> getNews(String sourceId) async {
//     Uri uri = Uri.https(Constant.BASE_URL, '/v2/everything',
//         {"apiKey": Constant.API_KEY, "sources": sourceId});
//     http.Response response = await http.get(uri);
//     var json = jsonDecode(response.body);
//     NewsResponse newsResponse = NewsResponse.fromJson(json);
//     return newsResponse;
//   }
// }