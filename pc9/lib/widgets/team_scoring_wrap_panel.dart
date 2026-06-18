import 'package:flutter/material.dart';

class TeamScoringWrapPanel extends StatelessWidget {
  const TeamScoringWrapPanel({
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
    final actions = <({String label, VoidCallback onTap})>[
      (label: freeThrowLabel, onTap: onFreeThrow),
      (label: twoPointsLabel, onTap: onTwoPoints),
      (label: threePointsLabel, onTap: onThreePoints),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.spaceBetween,
      children: [
        for (final a in actions)
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 140),
            child: FilledButton.tonal(
              onPressed: a.onTap,
              child: Text(a.label, textAlign: TextAlign.center),
            ),
          ),
      ],
    );
  }
}
