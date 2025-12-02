import 'package:dio/dio.dart';
import 'package:news_breeze/core/constants.dart';
import 'package:news_breeze/data/models/article_model.dart';

class NewsRepository {
  final Dio _dio = Dio();

  Future<List<Article>> getTopHeadlines({String country = 'us'}) async {
    try {
      String endpoint;
      Map<String, dynamic> params = {'apiKey': AppConstants.apiKey};

      if (country == 'us') {
        endpoint = '/top-headlines';
        params['country'] = 'us';
      } else {
        endpoint = '/everything';
        params['q'] = 'tecnologia';
        params['language'] = 'pt';
        params['sortBy'] = 'publishedAt';
      }

      final response = await _dio.get(
        '${AppConstants.baseUrl}$endpoint',
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        final List<dynamic> articlesJson = response.data['articles'];
        return articlesJson
            .map((json) => Article.fromJson(json))
            .where((article) => article.title != '[Removed]')
            .toList();
      } else {
        throw Exception('Falha ao carregar notícias');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
