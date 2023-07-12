import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cln_arch/config/routes/route.dart';
import 'package:news_app_cln_arch/config/themes/app_theme.dart';
import 'package:news_app_cln_arch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_cln_arch/injection_container.dart';

import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DailyNews()),
    );
  }
}
