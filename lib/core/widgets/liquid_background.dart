import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:sachin_portfolio/core/theme/app_colors.dart';

class LiquidBackground extends StatefulWidget {
  final Widget child;
  const LiquidBackground({super.key, required this.child});

  @override
  State<LiquidBackground> createState() => _LiquidBackgroundState();
}

class _LiquidBackgroundState extends State<LiquidBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);

    _animation1 = Tween<Offset>(
      begin: const Offset(-0.2, -0.2),
      end: const Offset(1.2, 0.8),
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut));
    _animation2 = Tween<Offset>(
      begin: const Offset(1.2, -0.2),
      end: const Offset(-0.2, 1.2),
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));
    _animation3 = Tween<Offset>(
      begin: const Offset(0.5, 1.2),
      end: const Offset(0.5, -0.2),
    ).animate(CurvedAnimation(parent: _controller3, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  Widget _buildBlob(Animation<Offset> animation, Color color, double size) {
    return SlideTransition(
      position: animation,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.5),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.5),
              blurRadius: 100,
              spreadRadius: 50,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dark Base
        Container(color: AppColors.primaryBackground),

        // Animated Blobs
        _buildBlob(_animation1, AppColors.blob1, 400),
        _buildBlob(_animation2, AppColors.blob2, 350),
        _buildBlob(_animation3, AppColors.blob3, 300),

        // Blur Overlay to fuse blobs - Heavy blur for "Liquid" effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
          child: Container(color: Colors.transparent),
        ),

        // Content
        widget.child,
      ],
    );
  }
}
