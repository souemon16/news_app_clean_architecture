import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_cln_arch/core/constants/const.dart';
import 'package:news_app_cln_arch/core/resources/data_state.dart';
import 'package:news_app_cln_arch/features/daily_news/data/data_sources/remote_data_sources/news_api_service.dart';
import 'package:news_app_cln_arch/features/daily_news/data/model/ArticleModel.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);
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
}
