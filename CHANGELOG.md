# Changelog

## [0.2.0] - 2025-11-28

### Adicionado
- **Filtro de País:** Funcionalidade na `AppBar` permitindo alternar entre notícias dos EUA e do Brasil.
- **UX (Empty State):** Implementação de mensagem amigável ("Nenhuma notícia encontrada") quando a API retorna uma lista vazia, evitando a tela branca.
- **Lógica de Eventos:** Atualização do `LoadNewsEvent` para aceitar parâmetros de filtro.

### Alterado
- **Repositório:** Refatoração da lógica de busca (`NewsRepository`).
  - `us` continua usando `top-headlines`.
  - `br` passa a usar o endpoint `everything` com query específica para garantir resultados e contornar limitações da API gratuita.

## [0.1.0] - 2025-11-28

### Adicionado
- **Arquitetura:** Estruturação inicial do projeto seguindo o padrão **MVVM** (Model-View-ViewModel).
- **Gerenciamento de Estado:** Implementação do padrão **BLoC** (`NewsBloc`, `NewsEvent`, `NewsState`).
- **Camada de Dados:**
  - Configuração do **Dio** para requisições HTTP.
  - Criação do modelo `Article` e do `NewsRepository`.
  - Integração com a NewsAPI (Endpoint `top-headlines`).
- **Interface de Usuário:**
  - Tela principal (`HomeScreen`) com listagem reativa.
  - Widget `NewsCard` com exibição de imagens em cache (`cached_network_image`).
  - Botão de seleção de país (EUA/Brasil).
- **Configurações:**
  - Injeção de dependências no `main.dart` (`RepositoryProvider` e `BlocProvider`).
  - Arquivo de constantes para gerenciamento de API Key e URLs.

### Corrigido
- **Android:** Adicionada permissão de internet (`android.permission.INTERNET`) no `AndroidManifest.xml` para execução em dispositivos físicos.