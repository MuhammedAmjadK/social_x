import 'package:flutter/material.dart';
import 'package:social_x/Controller/Functions/search_news.dart';
import 'package:social_x/Controller/Functions/user_signin_and_signout.dart';
import 'package:social_x/Controller/Repositories/news_repository.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Models/article_model.dart';
import 'package:social_x/Views/Widgets/newsscreen_widgets.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool showSearchField = false;
  bool isSearching = false;
  bool isDataFetched = false;

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  Future fetchData() async {
    await NewsRepository().fetchNews();
    setState(() {
      isDataFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: showSearchField
            ? TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      isSearching = true;
                      searchNews(value);
                    });
                  } else {
                    setState(() {
                      isSearching = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Search...',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showSearchField = false;
                          isSearching = false;
                        });
                      },
                      icon: const Icon(Icons.cancel, color: Colors.grey),
                    )),
              )
            : const Text(
                'Search in feed',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              showSearchField = true;
            });
          },
          icon: const Icon(
            Icons.search,
            color: Colors.blue,
            size: 36,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              signOutUser(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: articleModelListNotifier,
          builder:
              (BuildContext context, List<ArticleModel> _articleModelList, _) {
            return ListView.builder(
              itemCount: isDataFetched
                  ? isSearching
                      ? searchResult.length
                      : _articleModelList.length
                  : 10,
              itemBuilder: (context, index) {
                if (isDataFetched) {
                  ArticleModel? articleModel = isSearching
                      ? searchResult[index]
                      : _articleModelList[index];

                  return NewsCard(
                    title: articleModel.title,
                    description: articleModel.description,
                    publishedAt: articleModel.publishedAt,
                    urlToImage: articleModel.urlToImage,
                    name: articleModel.source.name,
                  );
                } else {
                  return const NewsShimmer();
                }
              },
            );
          }),
    );
  }
}
