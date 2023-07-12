import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_cln_arch/core/constants/const.dart';
import 'package:news_app_cln_arch/core/resources/data_state.dart';
import 'package:news_app_cln_arch/features/daily_news/data/data_sources/local_data_sources/app_database.dart';
import 'package:news_app_cln_arch/features/daily_news/data/data_sources/remote_data_sources/news_api_service.dart';
import 'package:news_app_cln_arch/features/daily_news/data/model/ArticleModel.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/entities/article.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey, category: categoryKey, country: countryKey);

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions));
    }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticle() {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
     return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
  }
}
