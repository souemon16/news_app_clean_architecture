import 'package:floor/floor.dart';

import 'package:news_app_cln_arch/features/daily_news/domain/entities/article.dart';

@Entity(tableName: 'article', primaryKeys: ["id"])
class ArticleModel extends ArticleEntity{
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map){
    return ArticleModel(
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity){
    return ArticleModel(
      id: entity.id,
      author: entity.autor,
      content: entity.content,
      description: entity.description,
      publishedAt: entity.publishedAt,
      title: entity.title,
      url: entity.url,
      urlToImage: entity.urlToImage
    );
  }
}