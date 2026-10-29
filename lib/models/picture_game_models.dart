import 'package:flutter/material.dart';

class PictureEntry {
  final String fileName; // cat.jpg
  final String assetPath; // assets/animals/cat.jpg
  final String question; // pregunta en español
  final List<String> options;
  final int correctIndex;

  const PictureEntry({
    required this.fileName,
    required this.assetPath,
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

class PictureLevel {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final List<String> fileNames;

  const PictureLevel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.fileNames,
  });
}
