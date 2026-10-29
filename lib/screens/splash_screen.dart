import 'dart:async';
import 'package:flutter/material.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ⏱️ 5 segundos y navega al menú
    Timer(const Duration(seconds: 5), () {
      if (mounted) Navigator.pushReplacementNamed(context, AppRoutes.menu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🌸 Fondo rosado suave para niñas
      backgroundColor: const Color(0xFFFFC1E3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 📸 Foto cuadrada con esquinas redondeadas
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'recursos/images/dalila-img-principal.webp', // 👈 cambia por tu archivo real
                width: 220,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 220,
                  height: 220,
                  color: Colors.pink.shade100,
                  child: const Icon(
                    Icons.photo,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // ✨ Título de la app
            const Text(
              'APP Dalila',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 8,
                    color: Colors.pinkAccent,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // ⏳ Círculo de carga
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
