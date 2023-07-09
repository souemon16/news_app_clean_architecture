import 'package:news_app_cln_arch/core/resources/data_state.dart';
import 'package:news_app_cln_arch/features/daily_news/data/model/ArticleModel.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }

}