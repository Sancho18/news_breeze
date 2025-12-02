import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_breeze/data/repositories/news_repository.dart';
import 'package:news_breeze/presentation/blocs/news/news_event.dart';
import 'package:news_breeze/presentation/blocs/news/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<LoadNewsEvent>(_onLoadNews);
  }

  Future<void> _onLoadNews(LoadNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final articles = await newsRepository.getTopHeadlines(country: event.countryCode);

      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError("Erro ao carregar notícias: $e"));
    }
  }
}
