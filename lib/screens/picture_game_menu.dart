import 'package:flutter/material.dart';
import '../data/picture_bank.dart';
import 'picture_juego.dart';

class Prueba9PictureMenu extends StatelessWidget {
  const Prueba9PictureMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Game'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.deepOrange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.image_search, size: 36, color: Colors.deepOrange),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¡Aprende inglés con imágenes!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Mira la imagen y elige la respuesta correcta.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...pictureLevels.map((level) {
            return Card(
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
                  '${level.subtitle} · ${level.fileNames.length} preguntas',
                ),
                trailing: const Icon(Icons.play_arrow, size: 30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Prueba9PictureJuego(level: level),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
