# PC9 — Placar de basquete (Flutter)

Aplicativo da atividade **PC.09**: placar para duas equipes com lances de 1, 2 e 3 pontos e botão **Voltar lance**, que desfaz **somente o último** lance registrado (fica desabilitado quando não há lance a desfazer ou logo após um desfazer).

## Requisitos atendidos

- Exibição do placar com `Text` (via widgets de placar).
- Equipe 1: três botões (+1, +2, +3) em layout com **`Table`**.
- Equipe 2: os mesmos três botões em **`Wrap`** (mecanismo de construção diferente).
- **Internacionalização**: textos em `lib/l10n/*.arb`, sem strings literais na UI; idiomas **pt** e **en** (padrão de resolução: **pt** quando o sistema não indica um idioma suportado).

## Como executar

```bash
flutter pub get
flutter run
```

Testes:

```bash
flutter test
```

## Estrutura

- `lib/main.dart` — `MaterialApp` com delegações de i18n.
- `lib/screens/basketball_score_screen.dart` — estado do placar e lógica de “último lance”.
- `lib/widgets/` — placar (`Card` + `Row`) e painéis de pontuação (`Table` / `Wrap`).

Os arquivos `lib/l10n/app_localizations*.dart` vêm dos `.arb` e **precisam existir** para o app compilar. Eles estão versionados neste repositório; se sumirem (clone incompleto, limpeza etc.), regenere:

```bash
flutter gen-l10n
# ou, em geral, após alterar .arb:
flutter pub get
```
