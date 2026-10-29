import 'package:flutter/material.dart';

/// Modelo que representa un elemento del menú principal.
class MenuItem {
  final String titulo;
  final IconData icono;
  final Color color;
  final String ruta; // 👈 ahora es un nombre de ruta

  const MenuItem({
    required this.titulo,
    required this.icono,
    required this.color,
    required this.ruta,
  });
}
