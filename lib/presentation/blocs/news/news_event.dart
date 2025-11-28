import 'package:equatable/equatable.dart';

// 1. Criamos uma classe base abstrata.
// Usamos Equatable para que o Flutter saiba comparar se dois eventos são iguais.
abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

// 2. Criamos o evento específico.
// "LoadNewsEvent" é o sinal que vamos mandar para o BLoC começar a trabalhar.
class LoadNewsEvent extends NewsEvent {}