import 'package:dio/dio.dart';

import '../shared/api_client.dart';
import 'article.dart';

/// Repository that loads articles from the backend API.
class ArticlesRepository {
  ArticlesRepository({Dio? dio}) : _dio = dio ?? createApiClient();

  final Dio _dio;

  Future<List<Article>> loadArticles() async {
    final response = await _dio.get<List<dynamic>>('/api/articles');
    final data = response.data ?? [];
    return data
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
