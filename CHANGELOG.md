# Changelog

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