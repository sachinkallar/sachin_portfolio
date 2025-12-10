import 'package:flutter/material.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/animated_section.dart';
import 'package:sachin_portfolio/core/widgets/section_container.dart';
import 'package:sachin_portfolio/features/projects/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: AnimatedSection(
        animationType: AnimationType.fadeInUp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notable Projects',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.primaryAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Selected works showcasing healthcare solutions, AI integration, and Flutter expertise.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 48),

            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.start,
                  children: const [
                    ProjectCard(
                      title: 'HealNTrack',
                      description:
                          'A Flutter Web healthcare platform utilizing modular architecture, BLoC state management, and AutoRoute for provider-side doctor management, charts, and dashboards.',
                      tags: ['Flutter Web', 'BLoC', 'AutoRoute', 'Healthcare'],
                      icon: Icons.monitor_heart_outlined,
                    ),
                    ProjectCard(
                      title: 'Medical Document Pipeline',
                      description:
                          'Comprehensive Flask backend for OCR, PDF parsing, and PHI extraction/scrubbing. Includes versioned storage and summarization endpoints.',
                      tags: ['Python', 'Flask', 'OCR', 'Transformers'],
                      icon: Icons.file_present_outlined,
                    ),
                    ProjectCard(
                      title: 'Clinical Summarizer',
                      description:
                          'Multimodal pipeline using Longformer and T5 models to generate structured patient summaries from unstructured text and OCR data.',
                      tags: ['AI', 'NLP', 'Longformer', 'Hugging Face'],
                      icon: Icons.psychology_outlined,
                    ),
                    ProjectCard(
                      title: 'DICOM Viewer Integration',
                      description:
                          'Implemented complex DICOM file rendering in Flutter with window-level adjustments, zooming, and optimized parsing of medical imaging metadata.',
                      tags: ['Flutter', 'DICOM', 'Canvas', 'Medical Imaging'],
                      icon: Icons.image_search_outlined,
                    ),
                    ProjectCard(
                      title: 'Geo-Aware Task List',
                      description:
                          'Architecture design for a task app with background geofencing, Google Calendar sync, and location-context notifications.',
                      tags: [
                        'Mobile Architecture',
                        'Geofencing',
                        'Background Services',
                      ],
                      icon: Icons.location_on_outlined,
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
