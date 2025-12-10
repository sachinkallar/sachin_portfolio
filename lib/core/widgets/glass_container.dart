import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? borderColor;
  final double borderWidth;
  final List<BoxShadow>? box_shadow;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 10,
    this.opacity = 0.1,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius,
    this.color,
    this.borderColor,
    this.borderWidth = 1.0,
    this.box_shadow,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color ?? AppColors.glassSurface.withValues(alpha: opacity),
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            border: Border.all(
              color:
                  borderColor ?? AppColors.glassBorder.withValues(alpha: 0.2),
              width: borderWidth,
            ),
            boxShadow: box_shadow,
          ),
          child: child,
        ),
      ),
    );
  }
}
