import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class NoiseOverlay extends StatelessWidget {
  final Widget child;
  final double opacity;

  const NoiseOverlay({
    super.key,
    required this.child,
    this.opacity = 0.03, // Subtle grain
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        IgnorePointer(
          child: Opacity(
            opacity: opacity,
            child: const CustomPaint(
              painter: _NoisePainter(),
              size: Size.infinite,
            ),
          ),
        ),
      ],
    );
  }
}

class _NoisePainter extends CustomPainter {
  const _NoisePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();
    final paint = Paint()..color = Colors.white; // White noise

    // Draw fewer points but larger for better performance than pixel-by-pixel
    // Or use drawPoints with a list.
    // For a 1080p screen, full pixel coverage is too slow.
    // We'll scatter enough points to create texture.

    final density = 0.6; // lower = less dense
    final width = size.width;
    final height = size.height;
    final count = (width * height * 0.005 * density).toInt();

    final points = List<Offset>.generate(count, (index) {
      return Offset(random.nextDouble() * width, random.nextDouble() * height);
    });

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  // Static noise is better for performance.
  // If we want animated noise, we need a ticker, but that might kill FPS on web.
  // Billo uses a static image overlay often, or a very optimized shader.
  // Static painter is safer for Flutter Web performance for now.
}
