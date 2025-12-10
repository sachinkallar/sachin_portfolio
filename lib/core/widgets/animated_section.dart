import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum AnimationType { fadeIn, fadeInUp, fadeInLeft, fadeInRight, scaleIn }

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final AnimationType animationType;
  final Duration? delay;
  final Duration? duration;
  final double? slideOffset;

  const AnimatedSection({
    super.key,
    required this.child,
    this.animationType = AnimationType.fadeInUp,
    this.delay,
    this.duration,
    this.slideOffset,
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('animated-section-${widget.hashCode}'),
      onVisibilityChanged: (info) {
        if (!_isVisible && info.visibleFraction > 0.1) {
          setState(() {
            _isVisible = true;
          });
          _controller.forward();
        }
      },
      child: _buildAnimatedChild(),
    );
  }

  Widget _buildAnimatedChild() {
    Animate animate = widget.child.animate(
      controller: _controller,
      autoPlay: false,
      delay: widget.delay ?? 0.ms,
    );

    final duration = widget.duration ?? 600.ms;
    final slideOffset = widget.slideOffset ?? 0.1;

    switch (widget.animationType) {
      case AnimationType.fadeIn:
        return animate.fadeIn(duration: duration);
      case AnimationType.fadeInUp:
        return animate
            .fadeIn(duration: duration)
            .slideY(
              begin: slideOffset,
              end: 0,
              duration: duration,
              curve: Curves.easeOut,
            );
      case AnimationType.fadeInLeft:
        return animate
            .fadeIn(duration: duration)
            .slideX(
              begin: -slideOffset,
              end: 0,
              duration: duration,
              curve: Curves.easeOut,
            );
      case AnimationType.fadeInRight:
        return animate
            .fadeIn(duration: duration)
            .slideX(
              begin: slideOffset,
              end: 0,
              duration: duration,
              curve: Curves.easeOut,
            );
      case AnimationType.scaleIn:
        return animate
            .fadeIn(duration: duration)
            .scale(
              begin: const Offset(0.9, 0.9),
              end: const Offset(1, 1),
              duration: duration,
              curve: Curves.easeOut,
            );
    }
  }
}
