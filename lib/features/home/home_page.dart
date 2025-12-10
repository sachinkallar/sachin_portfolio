import 'package:flutter/material.dart';
import 'package:sachin_portfolio/core/theme/app_colors.dart';
import 'package:sachin_portfolio/core/widgets/nav_bar.dart';
import 'package:sachin_portfolio/features/home/sections/hero_section.dart';
import 'package:sachin_portfolio/features/about/about_section.dart';
import 'package:sachin_portfolio/features/skills/skills_section.dart';
import 'package:sachin_portfolio/features/projects/projects_section.dart';
import 'package:sachin_portfolio/features/contact/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(key: _homeKey, height: 100), // Offset for navbar
                const HeroSection(),

                const SizedBox(height: 80),
                SizedBox(key: _aboutKey, child: const AboutSection()),

                const SizedBox(height: 80),
                SizedBox(key: _skillsKey, child: const SkillsSection()),

                const SizedBox(height: 80),
                SizedBox(key: _projectsKey, child: const ProjectsSection()),

                const SizedBox(height: 80),
                SizedBox(key: _contactKey, child: const ContactSection()),

                const SizedBox(height: 100), // Bottom padding
              ],
            ),
          ),

          // Fixed Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onHomeTap: () => _scrollToSection(_homeKey),
              onAboutTap: () => _scrollToSection(_aboutKey),
              onSkillsTap: () => _scrollToSection(_skillsKey),
              onProjectsTap: () => _scrollToSection(_projectsKey),
              onContactTap: () => _scrollToSection(_contactKey),
            ),
          ),
        ],
      ),
    );
  }
}
