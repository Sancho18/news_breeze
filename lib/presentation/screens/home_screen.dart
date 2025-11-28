import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_breeze/presentation/blocs/news/news_bloc.dart';
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
      ),
      // O BlocBuilder escuta mudanças no NewsBloc e redesenha a tela
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          
          // Caso 1: Carregando
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Caso 2: Sucesso (Temos dados!)
          if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return NewsCard(article: state.articles[index]);
              },
            );
          }

          // Caso 3: Erro
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

          // Caso 4: Estado Inicial (ou desconhecido)
          return const Center(child: Text("Bem-vindo ao NewsBreeze"));
        },
      ),
    );
  }
}