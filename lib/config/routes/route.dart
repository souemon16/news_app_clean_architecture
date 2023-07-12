import 'package:flutter/material.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/entities/article.dart';
import 'package:news_app_cln_arch/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:news_app_cln_arch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_cln_arch/features/daily_news/presentation/pages/saved_article.dart/saved__article.dart';

class AppRoutes{
  static Route onGenerateRoutes(RouteSettings settings){
    switch (settings.name) {
      case '/': 
      return _materialRoute(const DailyNews());
        
      case '/ArticleDetails':
      return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
      return _materialRoute(const SavedArticle());

      default:
      return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view){
    return MaterialPageRoute(builder: (_) => view);
  }
}