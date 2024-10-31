// lib/views/tanks_grid_view.dart
import 'package:flutter/cupertino.dart';
import 'package:fueliot/views/tank_card.dart';

import '../models/fuel_tank.dart';

class TanksGridView extends StatelessWidget {
  final List<FuelTank> tanks;

  const TanksGridView({super.key, required this.tanks});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: tanks.length,
      itemBuilder: (context, index) {
        return TankCard(tank: tanks[index]);
      },
    );
  }
}