import 'package:flutter/material.dart';

/// Una pregunta del test: enunciado en inglés, 4 opciones y la correcta.
class EnglishQuestion {
  final String question; // ej: "What color is the sky?"
  final List<String> options; // 4 opciones
  final int correctIndex; // índice de la respuesta correcta (0..3)

  const EnglishQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

/// Un nivel/clase del juego.
class EnglishLevel {
  final String id; // identificador único, ej: 'colors'
  final String title; // nombre visible: 'Colors'
  final String subtitle; // descripción corta: 'Los colores en inglés'
  final IconData icon;
  final Color color;
  final List<EnglishQuestion> questions;

  const EnglishLevel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.questions,
  });

  /// Puntuación máxima posible de esta clase.
  int get maxScore => questions.length;
}
