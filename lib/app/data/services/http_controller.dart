import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/articles.dart';

class HttpController extends GetxController {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'aaa803a13aec4f1b9cf73e5ffa1c1279';
  static const String _category = 'business';
  static const String _country = 'us';
  RxList<ArticleElement> articles = RxList<ArticleElement>([]);
  // RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }
  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));

      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = Article.fromJson(json.decode(jsonData)); // Adjusted reference
        articles.value = articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

}