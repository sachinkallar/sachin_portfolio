import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/glass_container.dart';
import 'package:sachin_portfolio/core/widgets/animated_section.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sachin_portfolio/core/widgets/section_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.secondaryBackground, // Remove solid background
      width: double.infinity,
      child: SectionContainer(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveBreakpoints.of(context).isMobile ? 16 : 24,
          vertical: 80,
        ),
        child: AnimatedSection(
          animationType: AnimationType.fadeInUp,
          child: GlassContainer(
            // Wrap content in Glass
            blur: 30,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(30),
            borderWidth: 1,
            borderColor: AppColors.glassBorder,
            child: Column(
              children: [
                Text(
                  'Get In Touch',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 500,
                  child: Text(
                    'I\'m currently open to new opportunities in Flutter development and AI engineering. Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () =>
                      _launch('mailto:sachin.chandran@example.com'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 24,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Say Hello'),
                ),
                const SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialIcon(
                      icon: FontAwesomeIcons.linkedin,
                      url: 'https://linkedin.com',
                    ),
                    const SizedBox(width: 32),
                    _SocialIcon(
                      icon: FontAwesomeIcons.github,
                      url: 'https://github.com',
                    ),
                    const SizedBox(width: 32),
                    _SocialIcon(
                      icon: FontAwesomeIcons.twitter,
                      url: 'https://twitter.com',
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Text(
                  '© ${DateTime.now().year} Sachin Chandran. Built with Flutter 3.10.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
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

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) await launchUrl(uri);
      },
      icon: Icon(icon, color: AppColors.textSecondary, size: 28),
      hoverColor: AppColors.primaryAccent.withValues(alpha: 0.1),
    );
  }
}
