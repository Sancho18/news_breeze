import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_breeze/presentation/blocs/news/news_bloc.dart';
import 'package:news_breeze/presentation/blocs/news/news_event.dart';
import 'package:news_breeze/presentation/blocs/news/news_state.dart';
import 'package:news_breeze/presentation/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewsBreeze 🍃',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (String countryCode) {
              context.read<NewsBloc>().add(
                LoadNewsEvent(countryCode: countryCode),
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'us',
                child: Row(
                  children: [
                    Text('🇺🇸 ', style: TextStyle(fontSize: 20)),
                    Text('Estados Unidos'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'br',
                child: Row(
                  children: [
                    Text('🇧🇷 ', style: TextStyle(fontSize: 20)),
                    Text('Brasil'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NewsLoaded) {
            if (state.articles.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 60, color: Colors.grey),
                    SizedBox(height: 16),
                    Text("Nenhuma notícia encontrada para esta região."),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return NewsCard(article: state.articles[index]);
              },
            );
          }
          if (state is NewsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text("Bem-vindo ao NewsBreeze"));
        },
      ),
    );
  }
}
