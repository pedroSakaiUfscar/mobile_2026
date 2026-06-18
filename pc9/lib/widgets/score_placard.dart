import 'package:flutter/material.dart';

class ScorePlacard extends StatelessWidget {
  const ScorePlacard({
    super.key,
    required this.heading,
    required this.team1Label,
    required this.team2Label,
    required this.team1Score,
    required this.team2Score,
  });

  final String heading;
  final String team1Label;
  final String team2Label;
  final int team1Score;
  final int team2Score;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              heading,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _TeamScoreColumn(
                    label: team1Label,
                    score: team1Score,
                    align: CrossAxisAlignment.start,
                  ),
                ),
                Container(
                  width: 1,
                  height: 72,
                  color: theme.colorScheme.outlineVariant,
                ),
                Expanded(
                  child: _TeamScoreColumn(
                    label: team2Label,
                    score: team2Score,
                    align: CrossAxisAlignment.end,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamScoreColumn extends StatelessWidget {
  const _TeamScoreColumn({
    required this.label,
    required this.score,
    required this.align,
  });

  final String label;
  final int score;
  final CrossAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(label, style: theme.textTheme.labelLarge),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '$score',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
