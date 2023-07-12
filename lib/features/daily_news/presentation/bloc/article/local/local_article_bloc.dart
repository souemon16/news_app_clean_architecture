import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/entities/article.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/usecases/get_saved_article_usecase.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app_cln_arch/features/daily_news/domain/usecases/save_article_usecase.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase getSavedArticleUseCase;
  final SaveArticleUseCase saveArticleUseCase;
  final RemoveArticleUseCase removeArticleUseCase;

  LocalArticleBloc(this.getSavedArticleUseCase, this.saveArticleUseCase,
      this.removeArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetSavedArticle>(onGetSavedArticle);
    on<SaveArticle>(onSaveArticle);
    on<RemoveArticle>(onRemoveArticle);
  }

  void onGetSavedArticle(
      GetSavedArticle event, Emitter<LocalArticleState> emit) async {
    final articles = await getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await removeArticleUseCase(params: removeArticle.articleEntity);
    final articles = await getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await saveArticleUseCase();
    final articles = await getSavedArticleUseCase(params: saveArticle.articleEntity);
    emit(LocalArticleDone(articles));
  }
}
