import 'package:flutter/material.dart';

class Prueba4Colores extends StatefulWidget {
  const Prueba4Colores({super.key});

  @override
  State<Prueba4Colores> createState() => _Prueba4ColoresState();
}

class _Prueba4ColoresState extends State<Prueba4Colores> {
  Color _color = Colors.blue;
  final List<Color> _colores = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba 4 - Colores')),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _color,
        child: Center(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: _colores
                .map(
                  (c) => GestureDetector(
                    onTap: () => setState(() => _color = c),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: c,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _color == c ? Colors.white : Colors.black26,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
