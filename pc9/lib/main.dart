import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'screens/basketball_score_screen.dart';

void main() {
  runApp(const Pc9App());
}

class Pc9App extends StatelessWidget {
  const Pc9App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)!.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeListResolutionCallback: (locales, supported) {
        if (locales == null || locales.isEmpty) {
          return const Locale('pt');
        }
        for (final preferred in locales) {
          for (final s in supported) {
            if (s.languageCode == preferred.languageCode) {
              return s;
            }
          }
        }
        return const Locale('pt');
      },
      home: const BasketballScoreScreen(),
    );
  }
}
