import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_breeze/data/repositories/news_repository.dart';
import 'package:news_breeze/presentation/blocs/news/news_bloc.dart';
import 'package:news_breeze/presentation/blocs/news/news_event.dart';
import 'package:news_breeze/presentation/screens/home_screen.dart';
import 'package:news_breeze/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Injetamos o Repositório (Dados)
    return RepositoryProvider(
      create: (context) => NewsRepository(),
      
      // 2. Injetamos o BLoC (Lógica), que depende do Repositório
      child: BlocProvider(
        create: (context) {
          // Buscamos o repositório que acabamos de injetar acima
          final repository = context.read<NewsRepository>();
          
          // Criamos o BLoC e JÁ DISPARAMOS o evento inicial
          // O '..add' é o operador cascade (executa e retorna o objeto)
          return NewsBloc(repository)..add(LoadNewsEvent());
        },
        child: MaterialApp(
          title: 'NewsBreeze',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.grey[100],
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}