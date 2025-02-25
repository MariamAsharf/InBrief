import 'package:news_app/cache_helper.dart';
import 'package:news_app/repository/repo.dart';

import '../model/news_response.dart';
import '../model/sources_response.dart';

class HomeLocalImpl implements HomeRepo {
  @override
  Future<NewsResponse> getNews(String sourceId) async {
    NewsResponse newsResponse = await HiveServices.getNewsResponse();
    return newsResponse;
  }

  @override
  Future<NewsResponse> getSearchNews(String q) {
    // TODO: implement getSearchNews
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSource(String catId) async {
    SourcesResponse sourcesResponse = await HiveServices.getSourceResponse();
    return sourcesResponse;
  }
}
