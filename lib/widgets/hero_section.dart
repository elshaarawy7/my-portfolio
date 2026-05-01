import 'dart:math' as math;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  final AppColors colors;
  final VoidCallback onContact;

  const HeroSection({super.key, required this.colors, required this.onContact});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _spinController;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  AppColors get c => widget.colors;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 80,
      ),
      child: isMobile
          ? Column(
              children: [
                _avatar(),
                const SizedBox(height: 40),
                _textContent(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _textContent()),
                const SizedBox(width: 60),
                _avatar(),
              ],
            ),
    );
  }

  Widget _textContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInLeft(
            duration: const Duration(milliseconds: 600),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 28, height: 1, color: c.accent),
                const SizedBox(width: 10),
                Text(
                  'FLUTTER DEVELOPER',
                  style: GoogleFonts.spaceMono(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: c.accent,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FadeInLeft(
            delay: const Duration(milliseconds: 200),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.syne(
                  fontSize: 52,
                  fontWeight: FontWeight.w800,
                  color: c.text,
                  height: 1.1,
                ),
                children: [
                  const TextSpan(text: 'Elshaarawy\n'),
                  TextSpan(
                    text: 'Hassan',
                    style: TextStyle(color: c.accent),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInLeft(
            delay: const Duration(milliseconds: 400),
            child: Text(
              '3rd-year CS student building clean, scalable Flutter apps.\nObsessed with Clean Architecture, BLoC, and shipping\napps that actually work.',
              style: GoogleFonts.syne(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: c.muted,
                height: 1.8,
              ),
            ),
          ),
          const SizedBox(height: 32),
          FadeInLeft(
            delay: const Duration(milliseconds: 600),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _btnPrimary('View Projects'),
                _btnOutline('Get in Touch', widget.onContact),
              ],
            ),
          ),
        ],
      );

  Widget _btnPrimary(String label) => Container(
        decoration: BoxDecoration(
          color: c.accent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              child: Text(
                label,
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _btnOutline(String label, VoidCallback onTap) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: c.border2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              child: Text(
                label,
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: c.text,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _avatar() => FadeInRight(
        duration: const Duration(milliseconds: 800),
        child: SizedBox(
          width: 280,
          height: 280,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Spinning dashed ring
              AnimatedBuilder(
                animation: _spinController,
                builder: (_, child) => Transform.rotate(
                  angle: _spinController.value * 2 * math.pi,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: c.accent.withValues(alpha: 0.4),
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                ),
              ),
              // Avatar circle
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: c.surface2,
                  border: Border.all(color: c.border2, width: 1),
                ),
                child: Center(
                  child: Text(
                    'EH',
                    style: GoogleFonts.syne(
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                      color: c.accent,
                    ),
                  ),
                ),
              ),
              // Status badge
              Positioned(
                bottom: 16,
                right: 0,
                child: _PulsingBadge(colors: c),
              ),
            ],
          ),
        ),
      );
}

class _PulsingBadge extends StatefulWidget {
  final AppColors colors;
  const _PulsingBadge({required this.colors});

  @override
  State<_PulsingBadge> createState() => _PulsingBadgeState();
}

class _PulsingBadgeState extends State<_PulsingBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _anim = Tween(begin: 1.0, end: 0.3).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: c.surface,
        border: Border.all(color: c.border2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _anim,
            builder: (_, child) => Opacity(
              opacity: _anim.value,
              child: Container(
                width: 7,
                height: 7,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: c.accent),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Open to Internships',
            style: GoogleFonts.spaceMono(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: c.accent,
            ),
          ),
        ],
      ),
    );
  }
}
