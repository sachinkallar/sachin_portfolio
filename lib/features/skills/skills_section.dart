import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/animated_section.dart';
import 'package:sachin_portfolio/core/widgets/glass_container.dart';
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
          children: skills.asMap().entries.map((entry) {
            return _SkillChip(label: entry.value, index: entry.key);
          }).toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  final int index;

  const _SkillChip({required this.label, required this.index});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: AnimatedScale(
            scale: _isHovering ? 1.1 : 1.0,
            duration: 200.ms,
            curve: Curves.easeOutBack,
            child: GlassContainer(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              borderRadius: BorderRadius.circular(24),
              blur: 10,
              opacity: _isHovering ? 0.2 : 0.1,
              borderColor: AppColors.primaryAccent.withValues(
                alpha: _isHovering ? 0.8 : 0.3,
              ),
              box_shadow: [
                if (_isHovering)
                  BoxShadow(
                    color: AppColors.primaryAccent.withValues(alpha: 0.4),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
              ],
              child: Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _isHovering
                      ? AppColors.primaryAccent
                      : AppColors.textPrimary,
                  fontWeight: _isHovering ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        )
        .animate(delay: (widget.index * 50).ms)
        .fadeIn(duration: 400.ms, curve: Curves.easeOut)
        .slideY(begin: 0.2, end: 0, duration: 400.ms, curve: Curves.easeOut);
  }
}
