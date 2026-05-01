import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _certsKey = GlobalKey();
  final _contactKey = GlobalKey();

  AppColors get colors => widget.isDark ? AppColors.dark : AppColors.light;

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.bg,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 70),
                HeroSection(key: _heroKey, colors: colors, onContact: () => _scrollTo(_contactKey)),
                _divider(),
                AboutSection(key: _aboutKey, colors: colors),
                _divider(),
                SkillsSection(key: _skillsKey, colors: colors),
                _divider(),
                ProjectsSection(key: _projectsKey, colors: colors),
                _divider(),
                CertsSection(key: _certsKey, colors: colors),
                _divider(),
                ContactSection(key: _contactKey, colors: colors),
                _footer(),
              ],
            ),
          ),
          // Fixed navbar
          NavBar(
            colors: colors,
            isDark: widget.isDark,
            onToggleTheme: widget.onToggleTheme,
            onAbout: () => _scrollTo(_aboutKey),
            onSkills: () => _scrollTo(_skillsKey),
            onProjects: () => _scrollTo(_projectsKey),
            onCerts: () => _scrollTo(_certsKey),
            onContact: () => _scrollTo(_contactKey),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(color: colors.border, height: 1, thickness: 1);

  Widget _footer() => Container(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Text(
          'Built with Flutter & ❤️ — Elshaarawy Hassan © 2026',
          style: GoogleFonts.spaceMono(fontSize: 12, color: colors.muted),
          textAlign: TextAlign.center,
        ),
      );
}
