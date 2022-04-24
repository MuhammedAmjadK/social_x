import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.name,
  }) : super(key: key);

  final String? title;
  final String? name;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;

  @override
  Widget build(BuildContext context) {
    var diff = (DateTime.now()).difference(DateTime.parse(publishedAt!));

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
                      text: TextSpan(
                        children: [
                          TextSpan(text: '${diff.inHours} hours ago '),
                          TextSpan(
                            text: name ?? 'UnknownSource',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Text(
                      title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Text(
                      description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    urlToImage ?? '',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Icon(
                        Icons.error_outline_sharp,
                        color: Colors.red,
                        size: 80,
                      );
                    },
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : const SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                            );
                    },
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({Key? key}) : super(key: key);

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
                children: const [
                  ShimmerBox(height: 15),
                  ShimmerBox(height: 40),
                  ShimmerBox(height: 40),
                ],
              ),
            ),
            const Expanded(
              child: ShimmerBox(height: 90, width: 90),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({Key? key, required this.height, this.width})
      : super(key: key);

  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          height: height,
          width: width ?? double.infinity,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200);
  }
}
