// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Placar de basquete';

  @override
  String get team1Title => 'Equipe 1';

  @override
  String get team2Title => 'Equipe 2';

  @override
  String get freeThrowButton => 'Lance livre (+1)';

  @override
  String get twoPointsButton => '+2 pontos';

  @override
  String get threePointsButton => '+3 pontos';

  @override
  String get undoLastPlay => 'Voltar lance';

  @override
  String get scoreHeading => 'Placar atual';
}
