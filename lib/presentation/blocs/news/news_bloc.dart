import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_breeze/data/repositories/news_repository.dart';
import 'package:news_breeze/presentation/blocs/news/news_event.dart';
import 'package:news_breeze/presentation/blocs/news/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  int _page = 1;
  String _currentCountry = 'us';

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<LoadNewsEvent>(_onLoadNews);
    on<LoadMoreNewsEvent>(_onLoadMoreNews);
  }

  Future<void> _onLoadNews(LoadNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      _page = 1;
      _currentCountry = event.countryCode;
      
      final articles = await newsRepository.getTopHeadlines(
        country: _currentCountry, 
        page: _page
      );
      
      emit(NewsLoaded(articles: articles, hasReachedMax: false));
    } catch (e) {
      emit(NewsError("Erro: $e"));
    }
  }

  Future<void> _onLoadMoreNews(LoadMoreNewsEvent event, Emitter<NewsState> emit) async {
    final currentState = state;
    if (currentState is NewsLoaded && !currentState.hasReachedMax) {
      try {
        _page++; // Próxima página
        
        final newArticles = await newsRepository.getTopHeadlines(
          country: _currentCountry, 
          page: _page
        );

        if (newArticles.isEmpty) {
          emit(currentState.copyWith(hasReachedMax: true));
        } else {
          emit(NewsLoaded(
            articles: currentState.articles + newArticles,
            hasReachedMax: false,
          ));
        }
      } catch (e) {
        emit(currentState.copyWith(hasReachedMax: true)); 
      }
    }
  }
}
