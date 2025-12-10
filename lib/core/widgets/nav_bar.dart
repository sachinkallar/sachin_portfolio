import 'package:flutter/material.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';

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
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground.withValues(alpha: 0.8),
        border: const Border(
          bottom: BorderSide(color: AppColors.surface, width: 1),
        ),
      ),
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

          // Desktop Menu
          Row(
            children: [
              _NavButton(text: 'Home', onTap: onHomeTap),
              _NavButton(text: 'About', onTap: onAboutTap),
              _NavButton(text: 'Skills', onTap: onSkillsTap),
              _NavButton(text: 'Projects', onTap: onProjectsTap),
              _NavButton(text: 'Contact', onTap: onContactTap, isGlow: true),
            ],
          ),
        ],
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
