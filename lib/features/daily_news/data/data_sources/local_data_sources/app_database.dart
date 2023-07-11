import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news_app_cln_arch/features/daily_news/data/data_sources/local_data_sources/DAO/article_dao.dart';
import 'package:news_app_cln_arch/features/daily_news/data/model/ArticleModel.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDAO;

  // After adding these just add part and generate floor code
  // run "flutter pub run build_runner build" 
}