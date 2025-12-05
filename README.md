# 📰 NewsBreeze

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![BLoC](https://img.shields.io/badge/State-BLoC-blue?style=for-the-badge&logo=flutter&logoColor=white)
![MVVM](https://img.shields.io/badge/Arch-MVVM-orange?style=for-the-badge)

> **Leitor de notícias moderno desenvolvido com Flutter.**
> Este projeto tem como foco principal o estudo aprofundado do padrão **BLoC (Business Logic Component)** aplicado em uma arquitetura **MVVM Clean**.

---

## 🚧 Status do Projeto

⚠️ **Em Desenvolvimento Inicial**

Este projeto está sendo construído passo a passo para demonstrar a implementação de uma arquitetura escalável sem o uso de frameworks "all-in-one" (como GetX), focando em padrões nativos e recomendados pela comunidade.

---

## 🎯 Objetivos de Aprendizado

-   Implementação do gerenciamento de estado com **flutter_bloc**.
-   Arquitetura **MVVM** (Model-View-ViewModel) com separação clara de responsabilidades.
-   Injeção de Dependências utilizando **RepositoryProvider** (ou GetIt).
-   Consumo de API REST (**NewsAPI**) utilizando **Dio**.
-   Comparação de estados com **Equatable**.

---

## 🛠️ Stack Tecnológica Planejada

-   **Linguagem:** Dart
-   **Framework:** Flutter
-   **State Management:** flutter_bloc
-   **HTTP Client:** Dio
-   **Value Equality:** Equatable
-   **Fonts:** Google Fonts
-   **Images:** Cached Network Image

---

## ✨ Funcionalidades

-   **Feed de Notícias:** -   Manchetes principais atualizadas em tempo real.
    -   **Scroll Infinito:** Carregamento automático de mais notícias conforme o usuário rola a tela (Paginação).
    -   **Filtro por Região:** Alternância rápida entre notícias dos EUA e Brasil.
-   **Tratamento de Erros:** Feedback visual amigável para falhas de conexão ou listas vazias.
-   **Performance:** Uso de Debounce e Cache de Imagens.

---

## 📂 Estrutura de Pastas (Planejada)

```text
lib/
├── core/                # Configurações globais e utilitários
├── data/                # Camada de Dados (Model)
│   ├── models/          # Parseamento de JSON
│   ├── repositories/    # Fontes de dados
│   └── services/        # Configuração de API
├── presentation/        # Camada de UI (View & ViewModel)
│   ├── blocs/           # ViewModels (Lógica de estado)
│   ├── screens/         # Telas
│   └── widgets/         # Componentes visuais
└── main.dart

---

## 👨‍💻 Autor

Desenvolvido por **Sancho18**.
