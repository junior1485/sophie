import 'package:flutter/material.dart';

class Prueba5Animacion extends StatefulWidget {
  const Prueba5Animacion({super.key});

  @override
  State<Prueba5Animacion> createState() => _Prueba5AnimacionState();
}

class _Prueba5AnimacionState extends State<Prueba5Animacion>
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
    _anim = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba 5 - Animación')),
      body: Center(
        child: ScaleTransition(
          scale: _anim,
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 100,
          ),
        ),
      ),
    );
  }
}
