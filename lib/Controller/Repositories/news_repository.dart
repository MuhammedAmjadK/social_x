import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Models/article_model.dart';

class NewsRepository {
  Future<List<ArticleModel>> fetchNews() async {
    articleModelListNotifier.value.clear();

    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2022-04-23&to=2022-04-23&sortBy=popularity&apiKey=2dc7c2ad4be64f0c8bf21de978c93291"));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _articleModel = ArticleModel.fromJson(item);
        articleModelListNotifier.value.add(_articleModel);
        articleModelListNotifier.notifyListeners();
      }
      return articleModelListNotifier.value;
    } else {
      return articleModelListNotifier.value; // empty list
    }
  }
}
