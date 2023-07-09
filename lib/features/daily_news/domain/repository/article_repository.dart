import 'package:news_app_cln_arch/core/resources/data_state.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}