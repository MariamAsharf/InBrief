import '../model/news_response.dart';
import '../model/sources_response.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSource(String catId);
  Future<NewsResponse> getNews(String sourceId);
  Future<NewsResponse> getSearchNews(String q);
}
