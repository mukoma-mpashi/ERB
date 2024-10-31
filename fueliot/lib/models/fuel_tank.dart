class FuelTank {
  final int id;
  final String name;
  final String fuelType;
  final int capacity;
  final int currentLevel;

  FuelTank({
    required this.id,
    required this.name,
    required this.fuelType,
    required this.capacity,
    required this.currentLevel,
  });

  factory FuelTank.fromJson(Map<String, dynamic> json) {
    return FuelTank(
      id: json['id'],
      name: json['name'],
      fuelType: json['fuelType'],
      capacity: json['capacity'],
      currentLevel: json['currentLevel'],
    );
  }
}
