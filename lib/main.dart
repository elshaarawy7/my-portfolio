import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  // ignore: library_private_types_in_public_api
  static _PortfolioAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_PortfolioAppState>();

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool isDark = true;

  void toggleTheme() => setState(() => isDark = !isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elshaarawy Hassan — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppTheme.dark() : AppTheme.light(),
      home: HomeScreen(isDark: isDark, onToggleTheme: toggleTheme),
    );
  }
}
