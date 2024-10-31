
// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tank_provider.dart';
import '../views/alert_lists.dart';
import '../views/tank_grid_views.dart' ;
import '../views/tank_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Station Monitoring Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tank Status Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Consumer<TankProvider>(
              builder: (context, provider, child) {
                return TanksGridView(tanks: provider.tanks);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Alerts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Consumer<TankProvider>(
              builder: (context, provider, child) {
                return AlertsList(alerts: provider.alerts);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement refresh
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
