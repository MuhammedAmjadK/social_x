import 'package:json_annotation/json_annotation.dart';
part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  Source source;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;

  ArticleModel({
    required this.source,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

@JsonSerializable()
class Source {
  String? id;
  String? name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
