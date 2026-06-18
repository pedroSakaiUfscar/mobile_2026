import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

import '../widgets/score_placard.dart';
import '../widgets/team_scoring_wrap_panel.dart';
import '../widgets/team_scoring_table_panel.dart';

class BasketballScoreScreen extends StatefulWidget {
  const BasketballScoreScreen({super.key});

  @override
  State<BasketballScoreScreen> createState() => _BasketballScoreScreenState();
}

class _LastScoring {
  const _LastScoring({required this.teamIndex, required this.points});

  final int teamIndex;
  final int points;
}

class _BasketballScoreScreenState extends State<BasketballScoreScreen> {
  int _team1 = 0;
  int _team2 = 0;
  _LastScoring? _lastScoring;

  void _addPoints(int teamIndex, int points) {
    setState(() {
      if (teamIndex == 0) {
        _team1 += points;
      } else {
        _team2 += points;
      }
      _lastScoring = _LastScoring(teamIndex: teamIndex, points: points);
    });
  }

  void _undoLastScoring() {
    final last = _lastScoring;
    if (last == null) return;
    setState(() {
      if (last.teamIndex == 0) {
        _team1 -= last.points;
      } else {
        _team2 -= last.points;
      }
      _lastScoring = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final canUndo = _lastScoring != null;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ScorePlacard(
                heading: l10n.scoreHeading,
                team1Label: l10n.team1Title,
                team2Label: l10n.team2Title,
                team1Score: _team1,
                team2Score: _team2,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.team1Title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              TeamScoringTablePanel(
                onFreeThrow: () => _addPoints(0, 1),
                onTwoPoints: () => _addPoints(0, 2),
                onThreePoints: () => _addPoints(0, 3),
                freeThrowLabel: l10n.freeThrowButton,
                twoPointsLabel: l10n.twoPointsButton,
                threePointsLabel: l10n.threePointsButton,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.team2Title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              TeamScoringWrapPanel(
                onFreeThrow: () => _addPoints(1, 1),
                onTwoPoints: () => _addPoints(1, 2),
                onThreePoints: () => _addPoints(1, 3),
                freeThrowLabel: l10n.freeThrowButton,
                twoPointsLabel: l10n.twoPointsButton,
                threePointsLabel: l10n.threePointsButton,
              ),
              const SizedBox(height: 28),
              FilledButton.tonalIcon(
                key: const ValueKey<String>('undoLastPlay'),
                onPressed: canUndo ? _undoLastScoring : null,
                icon: const Icon(Icons.undo),
                label: Text(l10n.undoLastPlay),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
