import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_breeze/data/repositories/news_repository.dart';
import 'package:news_breeze/presentation/blocs/news/news_event.dart';
import 'package:news_breeze/presentation/blocs/news/news_state.dart';

// O BLoC estende a classe Bloc e definimos <Evento, Estado>
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  // Precisamos do repositório para buscar os dados
  final NewsRepository newsRepository;

  // No construtor:
  // 1. Pedimos o repositório.
  // 2. Passamos o estado inicial (NewsInitial) para o super.
  // 3. Registramos os eventos usando 'on'.
  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    
    // "Quando acontecer o evento LoadNewsEvent, execute a função _onLoadNews"
    on<LoadNewsEvent>(_onLoadNews);
  }

  // Essa é a função que processa o evento
  Future<void> _onLoadNews(
    LoadNewsEvent event, 
    Emitter<NewsState> emit, // 'emit' é a ferramenta para mudar o estado
  ) async {
    
    // Passo 1: Avisa a tela que estamos carregando
    emit(NewsLoading());

    try {
      // Passo 2: Tenta buscar os dados no repositório
      final articles = await newsRepository.getTopHeadlines();

      // Passo 3: Se der certo, emite o estado de Sucesso com a lista
      emit(NewsLoaded(articles));
      
    } catch (e) {
      // Passo 4: Se der erro, emite o estado de Erro com a mensagem
      emit(NewsError("Erro ao carregar notícias: $e"));
    }
  }
}