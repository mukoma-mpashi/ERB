// lib/views/alerts_list.dart
import 'package:flutter/material.dart';
import '../models/alert.dart';

class AlertsList extends StatelessWidget {
  final List<Alert> alerts;

  const AlertsList({super.key, required this.alerts});

  @override
  Widget build(BuildContext context) {
    if (alerts.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No alerts at the moment'),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: alerts.length,
      itemBuilder: (context, index) {
        final alert = alerts[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Icon(
              Icons.warning,
              color: alert.severity == 'High' ? Colors.red : Colors.orange,
            ),
            title: Text('${alert.tankName} - ${alert.message}'),
            subtitle: Text(alert.timestamp),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Add alert actions here
              },
            ),
          ),
        );
      },
    );
  }
}