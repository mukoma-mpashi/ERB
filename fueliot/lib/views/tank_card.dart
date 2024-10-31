
// lib/views/tank_card.dart
import 'package:flutter/material.dart';
import 'package:fueliot/views/tank_level_indicator.dart';

import '../models/fuel_tank.dart';

class TankCard extends StatelessWidget {
  final FuelTank tank;

  const TankCard({super.key, required this.tank});

  @override
  Widget build(BuildContext context) {
    final percentage = (tank.currentLevel / tank.capacity * 100).round();
    Color levelColor = _getLevelColor(percentage);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tank.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Fuel Type: ${tank.fuelType}'),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: TankLevelIndicator(
                  percentage: percentage,
                  color: levelColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${tank.currentLevel}L / ${tank.capacity}L',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '$percentage% Full',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: levelColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getLevelColor(int percentage) {
    if (percentage > 60) return Colors.green;
    if (percentage > 30) return Colors.orange;
    return Colors.red;
  }
}