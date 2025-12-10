import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          child: Card(
            elevation: _isHovering
                ? widget.hoverElevation
                : widget.baseElevation,
            color: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
