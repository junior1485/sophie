import 'package:flutter/material.dart';
import '../data/english_levels.dart';
import 'ingles_juego.dart';

class InglesMenu extends StatelessWidget {
  const InglesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos de Inglés'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Cabecera informativa
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.school, size: 36, color: Colors.orange),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '¡Aprende inglés jugando!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Elige una clase. ${englishLevels.length} disponibles.',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Lista de clases
          ...englishLevels.map(
            (level) => Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: level.color,
                  child: Icon(level.icon, color: Colors.white),
                ),
                title: Text(
                  level.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  '${level.subtitle} · ${level.questions.length} preguntas',
                ),
                trailing: const Icon(Icons.play_arrow, size: 30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InglesJuego(level: level),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
