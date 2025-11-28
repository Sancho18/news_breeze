import 'package:equatable/equatable.dart';
import 'package:news_breeze/data/models/article_model.dart';

// 1. Classe base abstrata para todos os estados
abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

// 2. Estado Inicial: Antes de qualquer coisa acontecer.
class NewsInitial extends NewsState {}

// 3. Estado de Carregamento: Quando o spinner está rodando.
class NewsLoading extends NewsState {}

// 4. Estado de Sucesso: Quando a API respondeu e temos dados.
// Esse estado PRECISA carregar a lista de artigos dentro dele.
class NewsLoaded extends NewsState {
  final List<Article> articles;

  const NewsLoaded(this.articles);

  // O Equatable usa essa lista 'props' para saber se o estado mudou.
  // Se a lista de artigos for a mesma, ele não reconstrói a tela à toa.
  @override
  List<Object> get props => [articles];
}

// 5. Estado de Erro: Quando algo deu errado.
// Esse estado carrega a mensagem de erro para mostrarmos na tela.
class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}