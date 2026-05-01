import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/data.dart';
import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  final AppColors colors;
  const ProjectsSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return _Section(
      label: '// projects',
      title: "What I've Built",
      colors: c,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cols = constraints.maxWidth > 900
              ? 3
              : constraints.maxWidth > 580
              ? 2
              : 1;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.78,
            ),
            itemCount: projects.length,
            itemBuilder: (_, i) => FadeInUp(
              delay: Duration(milliseconds: i * 100),
              child: _ProjectCard(project: projects[i], colors: c),
            ),
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final AppColors colors;
  const _ProjectCard({required this.project, required this.colors});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: c.surface2,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _hovered ? c.accent : c.border),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: c.accent.withValues(alpha: 0.08),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image / emoji area
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              height: 140,
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                border: Border(bottom: BorderSide(color: c.border)),
              ),
              child: Center(
                child: Text(p.emoji, style: const TextStyle(fontSize: 52)),
              ),
            ),
            // Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.title,
                      style: GoogleFonts.syne(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: c.text,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        p.description,
                        style: GoogleFonts.syne(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: c.muted,
                          height: 1.6,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Stack tags
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: p.stack
                          .map(
                            (t) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: c.bg,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: c.border),
                              ),
                              child: Text(
                                t,
                                style: GoogleFonts.spaceMono(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: c.muted,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                    // Buttons
                    Row(
                      children: [
                        if (p.githubUrl != null)
                          _linkBtn(c, '🐙 GitHub', p.githubUrl!),
                        if (p.githubUrl != null && p.liveUrl != null)
                          const SizedBox(width: 8),
                        if (p.liveUrl != null)
                          _linkBtn(c, '🌐 Live Demo', p.liveUrl!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _linkBtn(AppColors c, String label, String url) => GestureDetector(
    onTap: () => launchUrl(Uri.parse(url)),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: c.accentDim),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceMono(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: c.accent,
        ),
      ),
    ),
  );
}

// ─── SHARED SECTION WRAPPER (local copy) ─────────────────────────────────────
class _Section extends StatelessWidget {
  final String label;
  final String title;
  final AppColors colors;
  final Widget child;

  const _Section({
    required this.label,
    required this.title,
    required this.colors,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 72),
      constraints: const BoxConstraints(maxWidth: 1260),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.spaceMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: c.accent,
                  letterSpacing: 3)),
          const SizedBox(height: 10),
          Text(title,
              style: GoogleFonts.syne(
                  fontSize: 32, fontWeight: FontWeight.w800, color: c.text)),
          const SizedBox(height: 36),
          child,
        ],
      ),
    );
  }
}
