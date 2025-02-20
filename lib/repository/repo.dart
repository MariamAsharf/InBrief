import '../model/newsResponse.dart';
import '../model/source_response.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSource(String catId);
  Future<NewsResponse> getNews(String sourceId);
  Future<NewsResponse> getSearchNews(String q);
}
