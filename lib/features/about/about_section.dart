import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/animated_section.dart';
import 'package:sachin_portfolio/core/widgets/hover_card.dart';
import 'package:sachin_portfolio/core/widgets/section_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: AnimatedSection(
        animationType: AnimationType.fadeInUp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.primaryAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'A versatile and forward-focused Flutter Developer with strong experience building production-grade healthcare, EMR, and AI-integrated applications. Skilled in architecting robust, modular Flutter apps and creating backend systems for medical data extraction, multimodal document understanding, and clinical workflows. Known for clean code, structured thinking, and the ability to solve complex technical problems across both mobile/web and backend AI pipelines.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textPrimary,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 48),

            // Strengths Grid
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    _StrengthCard(
                      icon: Icons.architecture,
                      title: 'Architectural Thinking',
                      description:
                          'Strong focus on scalable, modular, and testable code organization.',
                      delay: 0.ms,
                    ),
                    _StrengthCard(
                      icon: Icons.psychology,
                      title: 'AI Integration',
                      description:
                          'Seamless integration of LLMs, OCR, and transformers into mobile/web apps.',
                      delay: 100.ms,
                    ),
                    _StrengthCard(
                      icon: Icons.medical_services_outlined,
                      title: 'Healthcare Domain',
                      description:
                          'Deep understanding of EMRs, PHI security, and clinical workflows.',
                      delay: 200.ms,
                    ),
                    _StrengthCard(
                      icon: Icons.bug_report,
                      title: 'Debugging',
                      description:
                          'Excellent instincts for profiling and resolving complex performance issues.',
                      delay: 300.ms,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StrengthCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Duration delay;

  const _StrengthCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      animationType: AnimationType.scaleIn,
      delay: delay,
      child: HoverCard(
        hoverScale: 1.05,
        baseElevation: 2,
        hoverElevation: 10,
        color: AppColors.surface,
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.surface.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.secondaryAccent, size: 40),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
