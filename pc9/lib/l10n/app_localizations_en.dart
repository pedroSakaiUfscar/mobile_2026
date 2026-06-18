// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Basketball scoreboard';

  @override
  String get team1Title => 'Team 1';

  @override
  String get team2Title => 'Team 2';

  @override
  String get freeThrowButton => 'Free throw (+1)';

  @override
  String get twoPointsButton => '+2 points';

  @override
  String get threePointsButton => '+3 points';

  @override
  String get undoLastPlay => 'Undo last play';

  @override
  String get scoreHeading => 'Current score';
}
