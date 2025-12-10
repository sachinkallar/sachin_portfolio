import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/section_container.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, I\'m',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.primaryAccent,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 16),
          Text(
                'Sachin Chandran',
                style: Theme.of(context).textTheme.displayLarge,
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 500.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 16),
          Text(
                'Flutter Developer & AI Engineer',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              )
              .animate()
              .fadeIn(delay: 400.ms, duration: 500.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 32),
          SizedBox(
            width: 600,
            child: Text(
              'A results-driven Flutter Developer specializing in scalable, modular architectures and high-performance cross-platform applications. Experienced in delivering production-ready features for healthcare and EMR systems.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ).animate().fadeIn(delay: 600.ms, duration: 500.ms),
          const SizedBox(height: 48),

          // CTA Buttons
          Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to contact or open email
                    },
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('Contact Me'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Download Resume
                    },
                    icon: const Icon(FontAwesomeIcons.filePdf),
                    label: const Text('Download Resume'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primaryAccent),
                      foregroundColor: AppColors.primaryAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
              .animate()
              .fadeIn(delay: 800.ms, duration: 500.ms)
              .slideY(begin: 0.2, end: 0),

          const SizedBox(height: 64),

          // Social Links
          Row(
            children: [
              IconButton(
                onPressed: () => _launch('https://linkedin.com'),
                icon: const Icon(FontAwesomeIcons.linkedinIn),
                tooltip: 'LinkedIn',
              ),
              IconButton(
                onPressed: () => _launch('https://github.com'),
                icon: const Icon(FontAwesomeIcons.github),
                tooltip: 'GitHub',
              ),
            ],
          ).animate().fadeIn(delay: 1000.ms, duration: 500.ms),
        ],
      ),
    );
  }

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
