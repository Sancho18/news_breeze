# Changelog

## [0.2.0] - 2025-11-28

### Adicionado
- **Arquitetura BLoC:** Implementação completa da máquina de estados para o feed de notícias (`NewsBloc`, `NewsEvent`, `NewsState`).
- **Camada de Dados (Model & Repository):**
  - Criação do modelo `Article` para mapeamento JSON.
  - Implementação do `NewsRepository` utilizando **Dio** para consumo da NewsAPI.
- **Configurações:**
  - Arquivo `core/constants.dart` para centralizar Endpoints e API Keys.
- **Dependências:** Adição dos pacotes `flutter_bloc`, `equatable`, `dio`, `cached_network_image`, `google_fonts` e `intl`.