import 'package:equatable/equatable.dart';
import 'package:news_breeze/data/models/article_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> articles;
  final bool hasReachedMax;

  const NewsLoaded({required this.articles, this.hasReachedMax = false});
  NewsLoaded copyWith({List<Article>? articles, bool? hasReachedMax}) {
    return NewsLoaded(
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [articles, hasReachedMax];
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}
