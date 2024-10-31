import 'package:flutter/foundation.dart';

import '../models/alert.dart';
import '../models/fuel_tank.dart';

class TankProvider extends ChangeNotifier {
  List<FuelTank> _tanks = [];
  List<Alert> _alerts = [];

  List<FuelTank> get tanks => _tanks;
  List<Alert> get alerts => _alerts;

  void updateTanks(List<FuelTank> newTanks) {
    _tanks = newTanks;
    notifyListeners();
  }

  void updateAlerts(List<Alert> newAlerts) {
    _alerts = newAlerts;
    notifyListeners();
  }
}