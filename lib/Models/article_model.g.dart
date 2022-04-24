// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'source': instance.source,
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
