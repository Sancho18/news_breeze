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
    return RepositoryProvider(
      create: (context) => NewsRepository(),
      child: BlocProvider(
        create: (context) {
          final repository = context.read<NewsRepository>();
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
