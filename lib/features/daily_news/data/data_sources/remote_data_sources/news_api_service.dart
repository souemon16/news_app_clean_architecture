
import 'package:dio/dio.dart';
import 'package:news_app_cln_arch/core/constants/const.dart';
import 'package:news_app_cln_arch/features/daily_news/data/model/ArticleModel.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService{
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  }); 
} 
