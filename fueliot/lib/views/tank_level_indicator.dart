// lib/views/tank_level_indicator.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TankLevelIndicator extends StatefulWidget {
  final int percentage;
  final Color color;

  const TankLevelIndicator({
    super.key,
    required this.percentage,
    required this.color,
  });

  @override
  State<TankLevelIndicator> createState() => _TankLevelIndicatorState();
}

class _TankLevelIndicatorState extends State<TankLevelIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Background fill
              Container(
                height: 150 * widget.percentage / 100,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // Animated wave effect
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomPaint(
                  size: const Size(100, 150),
                  painter: WavePainter(
                    percentage: widget.percentage,
                    color: widget.color,
                    wavePhase: _controller.value * 2 * math.pi,
                  ),
                ),
              ),
              // Optional: Add level markers
              ...List.generate(5, (index) {
                return Positioned(
                  left: 0,
                  bottom: (150 / 4) * index.toDouble(),
                  child: Container(
                    width: 5,
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final int percentage;
  final Color color;
  final double wavePhase;

  WavePainter({
    required this.percentage,
    required this.color,
    required this.wavePhase,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final height = size.height * percentage / 100;
    const amplitude = 5.0;
    const frequency = 0.5;

    final path = Path();
    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x++) {
      final y = size.height -
          height +
          math.sin((x * frequency) + wavePhase) * amplitude;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) =>
      oldDelegate.wavePhase != wavePhase;
}