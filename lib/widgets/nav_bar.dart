import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final AppColors colors;
  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onCerts;
  final VoidCallback onContact;

  const NavBar({
    super.key,
    required this.colors,
    required this.isDark,
    required this.onToggleTheme,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onCerts,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 60,
      decoration: BoxDecoration(
        color: colors.bg.withValues(alpha: 0.9),
        border: Border(bottom: BorderSide(color: colors.border, width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          children: [
            Text(
              'EH.dev',
              style: GoogleFonts.spaceMono(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: colors.accent,
                letterSpacing: 2,
              ),
            ),
            const Spacer(),
            // Nav links - hide on small screens
            if (MediaQuery.of(context).size.width > 700) ...[
              _link('About', onAbout),
              _link('Skills', onSkills),
              _link('Projects', onProjects),
              _link('Certs', onCerts),
              _link('Contact', onContact),
              const SizedBox(width: 16),
            ],
            // Theme toggle
            GestureDetector(
              onTap: onToggleTheme,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: colors.surface2,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.border2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _themeBtn('DARK', isDark),
                    _themeBtn('LIGHT', !isDark),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _link(String label, VoidCallback onTap) => TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.spaceMono(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: colors.muted,
            letterSpacing: 1,
          ),
        ),
      );

  Widget _themeBtn(String label, bool active) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: active ? colors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: GoogleFonts.spaceMono(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: active ? Colors.black : colors.muted,
          ),
        ),
      );
}
