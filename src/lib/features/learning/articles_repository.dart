import 'dart:convert';

import 'package:flutter/services.dart';

import 'article.dart';

class ArticlesRepository {
  Future<List<Article>> loadArticles() async {
    final data = await rootBundle.loadString('assets/articles.json');
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Article.fromJson(e as Map<String, dynamic>)).toList();
  }
}
