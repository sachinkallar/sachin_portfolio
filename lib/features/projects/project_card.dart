import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/hover_card.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tags;
  final VoidCallback? onGitHubTap;
  final VoidCallback? onLiveTap;
  final IconData icon;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
    this.onGitHubTap,
    this.onLiveTap,
    this.icon = Icons.code,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: onLiveTap ?? onGitHubTap,
      color: AppColors.surface,
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: AppColors.primaryAccent, size: 32),
                Row(
                  children: [
                    if (onGitHubTap != null)
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.github, size: 20),
                        onPressed: onGitHubTap,
                        color: AppColors.textSecondary,
                        tooltip: 'View Code',
                      ),
                    if (onLiveTap != null)
                      IconButton(
                        icon: const Icon(Icons.open_in_new, size: 22),
                        onPressed: onLiveTap,
                        color: AppColors.textSecondary,
                        tooltip: 'View Live',
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) => _ProjectTag(label: tag)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectTag extends StatelessWidget {
  final String label;

  const _ProjectTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.primaryAccent,
          fontSize: 12,
        ),
      ),
    );
  }
}
