import 'package:flutter/material.dart';

class TeamScoringTablePanel extends StatelessWidget {
  const TeamScoringTablePanel({
    super.key,
    required this.onFreeThrow,
    required this.onTwoPoints,
    required this.onThreePoints,
    required this.freeThrowLabel,
    required this.twoPointsLabel,
    required this.threePointsLabel,
  });

  final VoidCallback onFreeThrow;
  final VoidCallback onTwoPoints;
  final VoidCallback onThreePoints;
  final String freeThrowLabel;
  final String twoPointsLabel;
  final String threePointsLabel;

  @override
  Widget build(BuildContext context) {
    Widget cell(EdgeInsets padding, String label, VoidCallback onTap) {
      return Padding(
        padding: padding,
        child: FilledButton(
          onPressed: onTap,
          child: Text(label, textAlign: TextAlign.center, maxLines: 2),
        ),
      );
    }

    return Table(
      defaultColumnWidth: const FlexColumnWidth(),
      children: [
        TableRow(
          children: [
            cell(const EdgeInsets.only(right: 4), freeThrowLabel, onFreeThrow),
            cell(
              const EdgeInsets.symmetric(horizontal: 4),
              twoPointsLabel,
              onTwoPoints,
            ),
            cell(
              const EdgeInsets.only(left: 4),
              threePointsLabel,
              onThreePoints,
            ),
          ],
        ),
      ],
    );
  }
}
