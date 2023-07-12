part of 'remote_article_bloc.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioException ? dioException;
  const RemoteArticleState({this.articles, this.dioException});
  
  @override
  List<Object> get props => [articles!, dioException!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException dioException) : super(dioException: dioException);
}
