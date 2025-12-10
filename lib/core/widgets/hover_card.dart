import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sachin_portfolio/core/widgets/glass_container.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double hoverScale;
  final double baseElevation;
  final double hoverElevation;
  final Color? color;
  final BorderRadius? borderRadius;

  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.hoverScale = 1.03,
    this.baseElevation = 2,
    this.hoverElevation = 8,
    this.color,
    this.borderRadius,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: 200.ms,
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..scale(
              _isHovering ? widget.hoverScale : 1.0,
              _isHovering ? widget.hoverScale : 1.0,
              _isHovering ? widget.hoverScale : 1.0,
            ),
          transformAlignment: Alignment.center,
          child: GlassContainer(
            blur: 15,
            opacity: _isHovering ? 0.1 : 0.05,
            borderColor: _isHovering
                ? AppColors.primaryAccent.withValues(alpha: 0.5)
                : AppColors.glassBorder,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
            box_shadow: [
              if (_isHovering)
                BoxShadow(
                  color: AppColors.primaryAccent.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: -5,
                ),
            ],
            padding: EdgeInsets.zero, // Let child handle padding
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
