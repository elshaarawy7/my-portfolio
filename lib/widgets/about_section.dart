import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../theme/app_theme.dart';
import '../models/data.dart';

// ─── ABOUT ───────────────────────────────────────────────────────────────────
class AboutSection extends StatelessWidget {
  final AppColors colors;
  const AboutSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final c = colors;
    return _Section(
      label: '// about me',
      title: 'Who I Am',
      colors: c,
      child: isMobile
          ? Column(children: [_bio(c), const SizedBox(height: 32), _stats(c)])
          : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(flex: 3, child: _bio(c)),
              const SizedBox(width: 40),
              Expanded(flex: 2, child: _stats(c)),
            ]),
    );
  }

  Widget _bio(AppColors c) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bioText(c, "I'm ", "Elshaarawy Hassan",
              ", a Computer Science student at Al-Shorouk Academy, Cairo with a deep focus on "),
          _bioText(c, "", "Flutter & Dart", " mobile development."),
          const SizedBox(height: 12),
          Text(
            "I build with Clean Architecture, BLoC/Cubit state management, REST APIs via Dio, Firebase backends, and payment integrations (Stripe & PayPal). I've shipped everything from Quran readers to full e-commerce platforms.",
            style: GoogleFonts.syne(
                fontSize: 14, fontWeight: FontWeight.w600, color: c.muted, height: 1.8),
          ),
          const SizedBox(height: 12),
          Text(
            "Currently seeking a Flutter internship to grow fast and build things that matter.",
            style: GoogleFonts.syne(
                fontSize: 14, fontWeight: FontWeight.w600, color: c.muted, height: 1.8),
          ),
        ],
      );

  Widget _bioText(AppColors c, String pre, String bold, String post) => RichText(
        text: TextSpan(
          style: GoogleFonts.syne(
              fontSize: 14, fontWeight: FontWeight.w600, color: c.muted, height: 1.8),
          children: [
            TextSpan(text: pre),
            TextSpan(
                text: bold,
                style: TextStyle(color: c.text, fontWeight: FontWeight.w800)),
            TextSpan(text: post),
          ],
        ),
      );

  Widget _stats(AppColors c) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.4,
        children: [
          _statCard(c, '10+', 'Apps Built'),
          _statCard(c, '3rd', 'Year CS'),
          _statCard(c, '2+', 'Years Flutter'),
          _statCard(c, '∞', 'Lines of Dart'),
        ],
      );

  Widget _statCard(AppColors c, String num, String label) => Container(
        decoration: BoxDecoration(
          color: c.surface2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: c.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(num,
                style: GoogleFonts.spaceMono(
                    fontSize: 28, fontWeight: FontWeight.w700, color: c.accent)),
            const SizedBox(height: 6),
            Text(label,
                style: GoogleFonts.syne(
                    fontSize: 11, fontWeight: FontWeight.w700, color: c.muted)),
          ],
        ),
      );
}

// ─── SKILLS ──────────────────────────────────────────────────────────────────
class SkillsSection extends StatelessWidget {
  final AppColors colors;
  const SkillsSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return _Section(
      label: '// tech stack',
      title: 'What I Work With',
      colors: c,
      child: LayoutBuilder(builder: (context, constraints) {
        final cols = (constraints.maxWidth / 150).floor().clamp(2, 6);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemCount: skills.length,
          itemBuilder: (_, i) => FadeInUp(
            delay: Duration(milliseconds: i * 60),
            child: _SkillCard(skill: skills[i], colors: c),
          ),
        );
      }),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillModel skill;
  final AppColors colors;
  const _SkillCard({required this.skill, required this.colors});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
        decoration: BoxDecoration(
          color: c.surface2,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _hovered ? c.accent : c.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.skill.icon, size: 28, color: _hovered ? c.accent : c.text),
            const SizedBox(height: 8),
            Text(widget.skill.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.syne(
                    fontSize: 11, fontWeight: FontWeight.w800, color: c.text)),
            const SizedBox(height: 2),
            Text(widget.skill.subtitle,
                style: GoogleFonts.spaceMono(fontSize: 9, color: c.muted)),
          ],
        ),
      ),
    );
  }
}

// ─── CERTS ───────────────────────────────────────────────────────────────────
class CertsSection extends StatelessWidget {
  final AppColors colors;
  const CertsSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return _Section(
      label: '// education & certs',
      title: 'Courses & Certificates',
      colors: c,
      child: LayoutBuilder(builder: (context, constraints) {
        final cols = constraints.maxWidth > 700 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3.5,
          ),
          itemCount: certs.length,
          itemBuilder: (_, i) => FadeInUp(
            delay: Duration(milliseconds: i * 80),
            child: _CertCard(cert: certs[i], colors: c),
          ),
        );
      }),
    );
  }
}

class _CertCard extends StatefulWidget {
  final CertModel2 cert;
  final AppColors colors;
  const _CertCard({required this.cert, required this.colors});

  @override
  State<_CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<_CertCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: c.surface2,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _hovered ? c.accent : c.border),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: c.accentDim,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(widget.cert.emoji,
                      style: const TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.cert.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.syne(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: c.text)),
                  const SizedBox(height: 2),
                  Text(widget.cert.issuer,
                      style: GoogleFonts.spaceMono(
                          fontSize: 10, color: c.accent)),
                  Text(widget.cert.date,
                      style:
                          GoogleFonts.syne(fontSize: 10, color: c.muted)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── CONTACT ─────────────────────────────────────────────────────────────────
class ContactSection extends StatelessWidget {
  final AppColors colors;
  const ContactSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return _Section(
      label: '// contact',
      title: "Let's Work Together",
      colors: c,
      center: true,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: c.surface2,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: c.border),
          ),
          child: Column(
            children: [
              Text(
                'Open to Flutter internships, freelance projects,\nand collaborations. Reach out anytime!',
                textAlign: TextAlign.center,
                style: GoogleFonts.syne(
                    fontSize: 14, fontWeight: FontWeight.w600, color: c.muted, height: 1.7),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _contactBtn(c, '📧', 'Gmail', 'mailto:elshaarawyhassan7@gmail.com'),
                  _contactBtn(c, '💬', 'WhatsApp', 'https://wa.me/201220117580'),
                  _contactBtn(c, '💼', 'LinkedIn',
                      'https://www.linkedin.com/in/elshaarawy-hassan-6020002b6/'),
                  _contactBtn(c, '🐙', 'GitHub', 'https://github.com/elshaarawy7'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactBtn(AppColors c, String emoji, String label, String url) =>
      _ContactButton(emoji: emoji, label: label, url: url, colors: c);
}

class _ContactButton extends StatefulWidget {
  final String emoji, label, url;
  final AppColors colors;
  const _ContactButton(
      {required this.emoji,
      required this.label,
      required this.url,
      required this.colors});

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _hovered ? c.accent : c.border2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.emoji, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 8),
            Text(widget.label,
                style: GoogleFonts.spaceMono(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: _hovered ? c.accent : c.text)),
          ],
        ),
      ),
    );
  }
}

// ─── SHARED SECTION WRAPPER ──────────────────────────────────────────────────
class _Section extends StatelessWidget {
  final String label;
  final String title;
  final AppColors colors;
  final Widget child;
  final bool center;

  const _Section({
    required this.label,
    required this.title,
    required this.colors,
    required this.child,
    this.center = false,
  });

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 72),
      constraints: const BoxConstraints(maxWidth: 1260),
      child: Column(
        crossAxisAlignment:
            center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
