import 'package:dio/dio.dart';
import 'package:news_breeze/core/constants.dart';
import 'package:news_breeze/data/models/article_model.dart';

class NewsRepository {
  final Dio _dio = Dio();

  Future<List<Article>> getTopHeadlines() async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}${AppConstants.topHeadlinesEndpoint}',
        queryParameters: {
          'country': 'br',
          'apiKey': AppConstants.apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> articlesJson = response.data['articles'];
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar notícias');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}