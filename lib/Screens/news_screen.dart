import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Search in feed',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.blue,
            size: 36,
          ),
        ),
      ),
      body: ListView(
        children: const [
          NewsCard(),
          NewsCard(),
          NewsCard(),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: '2 hours ago '),
                          TextSpan(
                            text: 'BBC News',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    child: Text(
                      'Apple admits slowing down older iPhones',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                    child: Text(
                      'Customers have long suspected iphones slowing down over time. Apple has confirmed some models do',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/facebook.png',
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
