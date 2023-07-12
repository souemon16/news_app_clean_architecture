import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_cln_arch/features/daily_news/data/data_sources/local_data_sources/app_database.dart';
import 'package:news_app_cln_arch/features/daily_news/data/data_sources/remote_data_sources/news_api_service.dart';
import 'package:news_app_cln_arch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/usecases/save_article_usecase.dart';
import 'package:news_app_cln_arch/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies 
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // UseCases 
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl.call()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl.call()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl.call()));

  // Bloc 
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  sl.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(sl(), sl(), sl()));
}