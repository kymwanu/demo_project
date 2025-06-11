# Demo Project

## Visão Geral

Este projeto é um aplicativo Flutter multiplataforma, com foco em navegação por abas, exibição de produtos e categorias, e interface visual customizada. Ele serve como base para aplicações de e-commerce, catálogos ou demonstrações de UI.

## Stacks e Versões Utilizadas

- **Flutter SDK:**  Certifique-se de utilizar a versão recomendada para o projeto. Exemplo: `Flutter 3.19.0` ou superior.
- **Dart:**  Compatível com a versão do Flutter utilizada. Exemplo: `Dart 3.3.0` ou superior.
- **Android SDK:**  Versão mínima recomendada: `API 21 (Android 5.0 Lollipop)` ou superior.
- **Xcode:**  Para builds iOS, recomenda-se `Xcode 14` ou superior.
- **Material Design:**  Utilizado via pacote oficial do Flutter.

> As versões exatas das dependências podem ser conferidas no arquivo [`pubspec.yaml`](pubspec.yaml) do projeto.

## Estrutura do Projeto

```
demo_project/
├── android/                        # Projeto nativo Android
├── assets/
│   ├── icons/
│   │   └── main_icons/             # Ícones principais do app
│   │       ├── favorite.png
│   │       ├── home.png
│   │       ├── person.png
│   │       ├── search.png
│   │       └── settings.png
│   └── images/                     # Imagens de produtos e categorias
│       ├── boots.jpg
│       ├── chair.jpg
│       ├── computer.jpg
│       ├── face_care.jpg
│       ├── hamburguer.jpg
│       ├── jeans.jpg
│       └── microwave.jpg
├── build/                          # Arquivos gerados de build
├── ios/                            # Projeto nativo iOS
├── lib/
│   └── app/
│       ├── models/                 # Modelos de dados
│       │   ├── category_model.dart
│       │   └── item_model.dart
│       ├── screens/                # Telas do aplicativo
│       │   ├── detail_screen.dart
│       │   ├── favorites_screen.dart
│       │   ├── home_screen.dart
│       │   ├── main_screen.dart
│       │   ├── profile_screen.dart
│       │   └── search_screen.dart
│       ├── services/               # Serviços e lógica de negócio
│       │   └── favorites_service.dart
│       └── widgets/                # Componentes reutilizáveis
│           ├── category_card_widget.dart
│           └── product_item_card_widget.dart
│   └── main.dart                   # Ponto de entrada do app
├── linux/                          # Projeto nativo Linux
├── macos/                          # Projeto nativo macOS
├── web/                            # Projeto web
```

- **assets/icons/main_icons/**: Ícones utilizados na navegação e menus.
- **assets/images/**: Imagens de produtos e categorias exibidas nas telas.
- **lib/app/models/**: Modelos de dados que representam categorias e itens/produtos.
- **lib/app/screens/**: Telas principais do aplicativo, como home, favoritos, detalhes, perfil e busca.
- **lib/app/services/**: Serviços responsáveis pela lógica de favoritos e outras funcionalidades.
- **lib/app/widgets/**: Componentes reutilizáveis, como cards de categoria e de produto.
- **lib/main.dart**: Arquivo principal que inicializa o app e define o tema.



## Principais Funcionalidades

- **Navegação por abas:** Utiliza `BottomNavigationBar` para alternar entre telas como Home, Favoritos e Pesquisa.
- **Exibição de produtos:** Lista produtos com imagens, descrições, preços e avaliações.
- **Categorias:** Permite filtrar produtos por categoria.
- **Temas adaptativos:** Suporte a temas claro e escuro, com configurações nativas no Android.

## Dependências

- [Flutter SDK](https://flutter.dev)
- [Material Design](https://pub.dev/packages/flutter)
- Outras dependências podem ser adicionadas no `pubspec.yaml`.

## Como Executar

1. **Instale o Flutter:**  
   Siga as instruções em [flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install).

2. **Instale as dependências:**  
   No terminal, execute:
   ```sh
   flutter pub get

3. **Execute o app**
    Para rodar no emulador ou dispositivo, execute flutter run