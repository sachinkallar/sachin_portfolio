import 'package:flutter/material.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/animated_section.dart';
import 'package:sachin_portfolio/core/widgets/section_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: AnimatedSection(
        animationType: AnimationType.fadeInLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Core Skills',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.primaryAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),

            _SkillCategory(
              title: 'Flutter / Dart',
              skills: const [
                'BLoC Pattern',
                'Clean Architecture',
                'GetIt DI',
                'AutoRoute v10',
                'Flutter Web',
                'Custom Theming',
                'Responsive UI',
                'DICOM Viewer Integration',
                'Platform Channels',
                'Performance Profiling',
              ],
            ),
            const SizedBox(height: 32),
            _SkillCategory(
              title: 'Backend & AI Integration',
              skills: const [
                'Flask (REST APIs)',
                'Medical Data Extraction',
                'OCR / PDF Parsing',
                'Transformers (Hugging Face)',
                'Whisper Transcription',
                'Longformer',
                'T5 Summarization',
                'Docker',
              ],
            ),
            const SizedBox(height: 32),
            _SkillCategory(
              title: 'System & Tools',
              skills: const [
                'Modular Architecture',
                'Structured Logging',
                'Git',
                'CI/CD Pipelines',
                'VS Code',
                'Agile/Scrum',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;

  const _SkillCategory({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.secondaryAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((skill) => _SkillChip(label: skill)).toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primaryAccent.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary),
      ),
    );
  }
}
