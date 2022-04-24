import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Models/article_model.dart';

List<ArticleModel> searchNews(String text) {
  final articleList = articleModelListNotifier.value;

  searchResult.clear();

  for (var news in articleList) {
    if ((news.title!.toLowerCase()).contains(text.toLowerCase())) {
      searchResult.add(news);
    }
  }

  return searchResult;
}
