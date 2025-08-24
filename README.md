# Sportiv Frontend

Aplicativo **Flutter** para o Sportiv — plataforma de criação e gerenciamento de torneios esportivos. Este repositório contém o **frontend** (mobile e web) que consome as APIs do Sportiv Backend e entrega uma experiência rápida, estável e responsiva.

---

## ✨ Funcionalidades

Por Enquanto Nada

---

## 🧰 Tecnologias Utilizadas

* **Flutter** (3.x) e **Dart**
* **flutter\_bloc** para estado
* **equatable** para value objects
* **json\_serializable / build\_runner** para modelos

> Altere/remova pacotes conforme a stack do projeto.

---

## 📁 Estrutura de Pastas

```
sportiv-frontend/
├── lib/
│   ├── core/
│   │   ├── config/            # Env, constants, themes
│   │   ├── di/                # Injeção de dependências
│   │   ├── routing/           # Rotas (go_router)
│   │   ├── utils/             # Helpers, formatadores, etc.
│   │   └── widgets/           # Widgets compartilhados
│   ├── features/
│   │   ├── auth/
│   │   │   ├── presentation/  # Pages, widgets
│   │   │   ├── application/   # Blocs/Cubits, usecases
│   │   │   ├── domain/        # Entidades e contratos
│   │   │   └── infrastructure/# Models, datasources, repos
│   │   ├── tournaments/
│   │   ├── teams/
│   │   └── profile/
│   ├── app.dart               # Raiz do app (MaterialApp)
│   └── main.dart              # Entry point
├── assets/
│   ├── images/
│   └── translations/
├── test/                      # Unit/widget tests
├── integration_test/          # Testes de integração (E2E)
├── analysis_options.yaml      # Regras de lint
├── pubspec.yaml
└── README.md
```

---

## ▶️ Como Executar

### Android/iOS

```bash
flutter run
```

### Web

```bash
flutter run -d chrome
```

### Build

```bash
# Android (APK debug)
flutter build apk --debug

# Android (APK release)
flutter build apk --release

# iOS (Archive via Xcode)
flutter build ios --release

# Web (release)
flutter build web
```

---

## 📸 Screenshots (opcional)

Por Enquanto Vazio

---

## 🤝 Contribuição

1. Faça um fork do repositório.
2. Crie uma branch: `git checkout -b feature/sua-feature`.
3. Implemente sua feature e testes.
4. Garanta que os testes passam e o lint está limpo.
5. Commit: `git commit -m "FEAT: descrição da sua feature"`.
6. Push: `git push origin feature/sua-feature`.
7. Abra um Pull Request descrevendo as mudanças.

> Siga a convenção de commits do projeto (ex.: `FEAT`, `FIX`, `DOCS`, `STYLE`, `TEST`, `WIP`).

---

## 📄 Licença

Este projeto é licenciado sob a **MIT License**. Veja `LICENSE` para mais detalhes.

---

## 🆘 Suporte

Abra uma **issue** neste repositório para dúvidas, bugs ou sugestões.

---

### Observações finais

* Troque `<seu-usuario>` na URL pelo seu usuário do GitHub.
* Ajuste nomes de pastas/features conforme seu projeto real.
* Caso não use alguns pacotes (ex.: `go_router`), remova as referências e atualize este RE
