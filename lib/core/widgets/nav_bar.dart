import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/glass_container.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    // Default to desktop if context doesn't have responsive info, or use a layout builder check
    // But since main.dart wraps in ResponsiveBreakpoints, this should work.
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return GlassContainer(
      borderRadius: BorderRadius.circular(0),
      blur: 20,
      opacity: 0.05,
      borderWidth: 0,
      borderColor: Colors.transparent,
      box_shadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sachin.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryAccent,
                ),
              ),

              if (isMobile)
                IconButton(
                  onPressed: () => _showMobileMenu(context),
                  icon: const Icon(Icons.menu, color: AppColors.primaryAccent),
                )
              else
                Row(
                  children: [
                    _NavButton(text: 'Home', onTap: onHomeTap),
                    _NavButton(text: 'About', onTap: onAboutTap),
                    _NavButton(text: 'Skills', onTap: onSkillsTap),
                    _NavButton(text: 'Projects', onTap: onProjectsTap),
                    _NavButton(
                      text: 'Contact',
                      onTap: onContactTap,
                      isGlow: true,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: GlassContainer(
            blur: 30,
            opacity: 0.1,
            borderRadius: BorderRadius.zero,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _MobileNavButton(
                    text: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                      onHomeTap();
                    },
                  ),
                  _MobileNavButton(
                    text: 'About',
                    onTap: () {
                      Navigator.pop(context);
                      onAboutTap();
                    },
                  ),
                  _MobileNavButton(
                    text: 'Skills',
                    onTap: () {
                      Navigator.pop(context);
                      onSkillsTap();
                    },
                  ),
                  _MobileNavButton(
                    text: 'Projects',
                    onTap: () {
                      Navigator.pop(context);
                      onProjectsTap();
                    },
                  ),
                  _MobileNavButton(
                    text: 'Contact',
                    onTap: () {
                      Navigator.pop(context);
                      onContactTap();
                    },
                    isGlow: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isGlow;

  const _MobileNavButton({
    required this.text,
    required this.onTap,
    this.isGlow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: isGlow
              ? AppColors.primaryBackground
              : AppColors.textPrimary,
          backgroundColor: isGlow ? AppColors.primaryAccent : null,
          padding: EdgeInsets.symmetric(
            horizontal: isGlow ? 32 : 16,
            vertical: 16,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isGlow ? Colors.black : AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isGlow;

  const _NavButton({
    required this.text,
    required this.onTap,
    this.isGlow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: isGlow
              ? AppColors.primaryBackground
              : AppColors.textPrimary,
          backgroundColor: isGlow ? AppColors.primaryAccent : null,
          padding: EdgeInsets.symmetric(
            horizontal: isGlow ? 20 : 12,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: isGlow ? Colors.black : AppColors.textSecondary,
            fontWeight: isGlow ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
