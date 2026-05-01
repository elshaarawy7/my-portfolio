import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class ProjectModel {
  final String title;
  final String emoji;
  final String description;
  final List<String> stack;
  final String? githubUrl;
  final String? liveUrl;
  final String bgColor;

  const ProjectModel({
    required this.title,
    required this.emoji,
    required this.description,
    required this.stack,
    this.githubUrl,
    this.liveUrl,
    this.bgColor = '#1a1a2e',
  });
}

class SkillModel {
  final String name;
  final String subtitle;
  final IconData icon;

  const SkillModel({
    required this.name,
    required this.subtitle,
    required this.icon,
  });
}

class CertModel {
  final String emoji;
  final String title;
  final String issuer;
  final String date;

  const CertModel({
    required this.emoji,
    required this.title,
    required this.issuer,
    required this.date,
  });
}

class CertModel2 {
  final String emoji;
  final String title;
  final String issuer;
  final String date;

  const CertModel2({
    required this.emoji,
    required this.title,
    required this.issuer,
    required this.date,
  });
}

const List<ProjectModel> projects = [
  ProjectModel(
    title: 'Rahhala',
    emoji: '✈️',
    description:
        'Flight booking app to search and book tickets by destination and airline. Features smooth booking flow, departure/arrival details, ticket pricing, and in-app online payment.',
    stack: ['Flutter', 'BLoC/Cubit', 'Dio', 'Clean Arch', 'Payment API'],
    githubUrl: 'https://github.com/elshaarawy7/Rahhala',
    bgColor: '#1a1433',
  ),
  ProjectModel(
    title: 'Modrak',
    emoji: '🕌',
    description:
        'Islamic history learning app covering Seerah, Rashidun, Umayyad, Abbasid, Ottoman Caliphate, and Andalusia — structured lessons with a clean Arabic UI.',
    stack: ['Flutter', 'Firebase', 'BLoC', 'Arabic UI', 'Clean Arch'],
    githubUrl: 'https://github.com/elshaarawy7/mdark',
    bgColor: '#1b3a2d',
  ),
  ProjectModel(
    title: 'Makxan Pro',
    emoji: '📦',
    description:
        'Product inventory management app — track stock, monitor total profit, get low-stock alerts, and add products with images from camera or gallery.',
    stack: ['Flutter', 'Firebase', 'Cubit', 'Clean Arch', 'SOLID'],
    githubUrl: 'https://github.com/elshaarawy7/Product-Inventory-App',
    bgColor: '#1a2f1a',
  ),
  ProjectModel(
    title: 'IStayLac',
    emoji: '🛍️',
    description:
        'E-commerce Flutter Web app with product browsing, category filtering, and a clean modern UI. Deployed live on Firebase Hosting.',
    stack: ['Flutter Web', 'Firebase', 'Cubit', 'REST API'],
    liveUrl: 'https://stylac-19229.web.app/',
    bgColor: '#1a1a2e',
  ),
  ProjectModel(
    title: 'Chat App',
    emoji: '💬',
    description:
        'Real-time chat with Firebase backend, FirebaseAuth login, Firestore messaging, and multi-account support.',
    stack: ['Flutter', 'Firebase', 'Firestore', 'FirebaseAuth'],
    bgColor: '#1a2a3a',
  ),
  ProjectModel(
    title: 'Quran App',
    emoji: '📖',
    description:
        'Full Quran reader with random verse display, last-read tracking, complete surah browser with search, and REST API integration.',
    stack: ['Flutter', 'REST API', 'Cubit', 'SharedPrefs'],
    bgColor: '#2a1a1a',
  ),

  ProjectModel(
    title: 'Fuiler E-Commerce App',
    emoji: '🛍️',
    description:
        'Fuiler is an e-commerce app with a clean modern UI. Deployed live on Firebase Hosting.',
    stack: ['Flutter', 'REST API', 'Cubit', 'SharedPrefs'],
    bgColor: '#2a1a1a',
  ),
];

const List<SkillModel> skills = [
  SkillModel(
    name: 'Flutter',
    subtitle: 'Mobile Dev',
    icon: SimpleIcons.flutter,
  ),
  SkillModel(name: 'Dart', subtitle: 'Language', icon: SimpleIcons.dart),
  SkillModel(name: 'C++', subtitle: 'Language', icon: SimpleIcons.cplusplus),
  SkillModel(name: 'SQL', subtitle: 'Database', icon: Icons.storage),
  SkillModel(name: 'Git', subtitle: 'Version Control', icon: SimpleIcons.git),
  SkillModel(name: 'GitHub', subtitle: 'Hosting', icon: SimpleIcons.github),
  SkillModel(name: 'Firebase', subtitle: 'Backend', icon: SimpleIcons.firebase),
  SkillModel(
    name: 'BLoC / Cubit',
    subtitle: 'State Mgmt',
    icon: Icons.view_in_ar,
  ),
  SkillModel(
    name: 'Clean Arch',
    subtitle: 'Architecture',
    icon: Icons.architecture,
  ),
  SkillModel(name: 'Stripe', subtitle: 'Payments', icon: SimpleIcons.stripe),
  SkillModel(name: 'PayPal', subtitle: 'Payments', icon: SimpleIcons.paypal),
  SkillModel(name: 'Canva', subtitle: 'Design', icon: SimpleIcons.canva),
  SkillModel(name: 'Figma', subtitle: 'Design', icon: SimpleIcons.figma),
  SkillModel(name: 'Dio', subtitle: 'Network', icon: Icons.wifi_tethering),
  SkillModel(name: 'Http', subtitle: 'Network', icon: Icons.http),
];

const List<CertModel2> certs = [
  CertModel2(
    emoji: '🎓',
    title: 'BSc Computer Science',
    issuer: 'Al-Shorouk Academy · Cairo',
    date: 'Faculty of Computers & Info · In Progress',
  ),
  CertModel2(
    emoji: '🏗️',
    title: 'Deep Dive into Clean Architecture in Flutter',
    issuer: 'Udemy · 2025',
    date: 'Clean Architecture · SOLID Principles',
  ),
  CertModel2(
    emoji: '📱',
    title: 'Complete Flutter & Dart Development Course',
    issuer: 'Udemy · 2024',
    date: 'Flutter UI · Dart · API Integration',
  ),
  CertModel2(
    emoji: '🧱',
    title: 'Flutter Advanced Course: Bloc & MVVM Pattern',
    issuer: 'Udemy · 2024',
    date: 'BLoC · MVVM · Dependency Injection',
  ),
  CertModel2(
    emoji: '💳',
    title: 'Flutter Payment Integration: Stripe & PayPal',
    issuer: 'Udemy · Arabic',
    date: 'Stripe · PayPal · Payment Gateways',
  ),
  CertModel2(
    emoji: '🔥',
    title: 'Flutter & Firebase: Build Your E-Commerce App',
    issuer: 'Tharwat Academy',
    date: 'Firebase · Flutter · E-Commerce',
  ),
  CertModel2(
    emoji: '🧠',
    title: 'Mastering Programming: A Comprehensive Course',
    issuer: 'Udemy · 2024',
    date: 'Problem Solving · DSA · OOP',
  ),
  CertModel2(
    emoji: '🌿',
    title: 'Master Git & GitHub: Essential Skills',
    issuer: 'Udemy',
    date: 'Git · Branching · Version Control',
  ),

  CertModel2(
    emoji: '💡',
    title: 'Data Structures & Algorithms',
    issuer: 'learn simple',
    date: 'Data Structures · Algorithms',
  ),
];
