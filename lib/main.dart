import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cln_arch/config/themes/app_theme.dart';
import 'package:news_app_cln_arch/features/daily_news/presentation/bloc/article/bloc/remote_article_bloc.dart';
import 'package:news_app_cln_arch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_cln_arch/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) =>  sl()..add(const GetArticles()),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          home: DailyNews()),
    );
  }
}
