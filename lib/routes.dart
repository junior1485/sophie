import 'package:flutter/material.dart';

// Importamos todas las pantallas
import 'screens/splash_screen.dart';
import 'screens/menu_page.dart';
import 'screens/prueba1_contador.dart';
import 'screens/prueba2_formulario.dart';
import 'screens/prueba3_lista.dart';
import 'screens/prueba4_colores.dart';
import 'screens/prueba5_animacion.dart';

// Agrega el import
import 'screens/ingles_menu.dart';
// Agrega el import
import 'screens/picture_game_menu.dart';

// Dentro de AppRoutes:

// Dentro del mapa appRoutes:

// Dentro de AppRoutes:

// Dentro del mapa appRoutes:
/// Clase con los nombres de todas las rutas de la app.
/// Usar estas constantes evita errores de tipeo.
class AppRoutes {
  static const String splash = '/';
  static const String menu = '/menu';
  static const String prueba1 = '/prueba1';
  static const String prueba2 = '/prueba2';
  static const String prueba3 = '/prueba3';
  static const String prueba4 = '/prueba4';
  static const String prueba5 = '/prueba5';
  static const String english = '/ingles';
  static const String picturegame = '/picturegame';
}

/// Mapa que asocia cada nombre de ruta con su pantalla.
final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.splash: (_) => const SplashScreen(),
  AppRoutes.menu: (_) => const MenuPage(),
  AppRoutes.prueba1: (_) => const Prueba1Contador(),
  AppRoutes.prueba2: (_) => const Prueba2Formulario(),
  AppRoutes.prueba3: (_) => const Prueba3Lista(),
  AppRoutes.prueba4: (_) => const Prueba4Colores(),
  AppRoutes.prueba5: (_) => const Prueba5Animacion(),
  AppRoutes.english: (_) => const InglesMenu(),
  AppRoutes.picturegame: (_) => const Prueba9PictureMenu(),
};
