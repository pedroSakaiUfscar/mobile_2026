import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pc9/l10n/app_localizations.dart';
import 'package:pc9/screens/basketball_score_screen.dart';

void main() {
  testWidgets('soma pontos e desfaz apenas o último lance', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('pt'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const BasketballScoreScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Placar de basquete'), findsOneWidget);

    final add2 = find.widgetWithText(FilledButton, '+2 pontos');
    final add3 = find.widgetWithText(FilledButton, '+3 pontos');

    await tester.tap(add2.first);
    await tester.pumpAndSettle();

    expect(find.text('2'), findsOneWidget);

    await tester.tap(add3.at(1));
    await tester.pumpAndSettle();

    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);

    final voltarFinder = find.byKey(const ValueKey<String>('undoLastPlay'));
    await tester.tap(voltarFinder);
    await tester.pumpAndSettle();

    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsNothing);

    expect(tester.widget<FilledButton>(voltarFinder).onPressed, isNull);
  });
}
