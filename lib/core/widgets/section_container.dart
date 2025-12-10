import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const SectionContainer({
    super.key,
    required this.child,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    final defaultPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 16, vertical: 32)
        : isTablet
        ? const EdgeInsets.symmetric(horizontal: 32, vertical: 40)
        : const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 48,
          ); // Desktop content is centered with max width

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: width ?? 1200),
        padding: padding ?? defaultPadding,
        child: child,
      ),
    );
  }
}
