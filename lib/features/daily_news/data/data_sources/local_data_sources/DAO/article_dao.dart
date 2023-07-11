import 'package:floor/floor.dart';
import '../../../model/ArticleModel.dart';

@dao
abstract class ArticleDao{
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('Select from article')
  Future<List<ArticleModel>> getArticles();
}