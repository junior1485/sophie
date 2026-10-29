import 'package:flutter/material.dart';
import '../data/picture_bank.dart';
import '../models/picture_game_models.dart';
import 'package:just_audio/just_audio.dart';

class Prueba9PictureJuego extends StatefulWidget {
  final PictureLevel level;
  const Prueba9PictureJuego({super.key, required this.level});

  @override
  State<Prueba9PictureJuego> createState() => _Prueba9PictureJuegoState();
}

class _Prueba9PictureJuegoState extends State<Prueba9PictureJuego> {
  late List<PictureEntry> _preguntas;
  int _indiceActual = 0;
  int _puntos = 0;
  int? _seleccion;
  bool _respondido = false;
  bool _terminado = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _reproducirSonido(String nombreArchivo) async {
    try {
      // 1. Detenemos cualquier reproducción anterior
      await _audioPlayer.stop();

      // 2. Cargamos el nuevo asset (la ruta es la misma)
      await _audioPlayer.setAsset('recursos/sounds/$nombreArchivo');

      // 3. Reproducimos
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Error al reproducir sonido: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // 👈 libera el reproductor
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _prepararPreguntas();
  }

  void _prepararPreguntas() {
    final preguntas = widget.level.fileNames
        .map((fileName) => buscarEnBanco(fileName))
        .whereType<PictureEntry>()
        .toList()
      ..shuffle();

    setState(() {
      _preguntas = preguntas;
    });
  }

  void _seleccionarOpcion(int index) {
    if (_respondido) return;
    final correcta = _preguntas[_indiceActual].correctIndex;
    setState(() {
      _seleccion = index;
      _respondido = true;
      if (index == correcta) _puntos++;
    });

    // 👇 Sonido según acierto o fallo
    if (index == correcta) {
      _reproducirSonido('correct.mp3');
    } else {
      _reproducirSonido('wrong.mp3');
    }
  }

  void _siguiente() {
    if (_indiceActual + 1 >= _preguntas.length) {
      if (_puntos == _preguntas.length) {
        _reproducirSonido('win.mp3');
      }
      setState(() => _terminado = true);
    } else {
      setState(() {
        _indiceActual++;
        _seleccion = null;
        _respondido = false;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _indiceActual = 0;
      _puntos = 0;
      _seleccion = null;
      _respondido = false;
      _terminado = false;
    });
    _prepararPreguntas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.level.title),
        backgroundColor: widget.level.color,
        foregroundColor: Colors.white,
      ),
      body: _preguntas.isEmpty
          ? const Center(child: Text('No hay preguntas disponibles'))
          : _terminado
              ? _pantallaResultados()
              : _pantallaJuego(),
    );
  }

  Widget _pantallaJuego() {
    final total = _preguntas.length;
    final pregunta = _preguntas[_indiceActual];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Pregunta ${_indiceActual + 1} / $total',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text(
                '$_puntos',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: (_indiceActual + 1) / total,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(widget.level.color),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.level.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: widget.level.color, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
//cambiar
                  child: Image.asset(
                    pregunta.assetPath,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint('RUTA QUE FALLÓ: $error');
                      return Container(
                        height: 180,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.broken_image,
                                  size: 60, color: Colors.grey),
                              const SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Error al cargar:\n$error',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  pregunta.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(pregunta.options.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _botonOpcion(i, pregunta),
            );
          }),
          if (_respondido) ...[
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _siguiente,
              icon: Icon(
                _indiceActual + 1 >= total ? Icons.flag : Icons.arrow_forward,
              ),
              label: Text(
                _indiceActual + 1 >= total ? 'Ver resultados' : 'Siguiente',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.level.color,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _botonOpcion(int index, PictureEntry pregunta) {
    final esCorrecta = index == pregunta.correctIndex;
    final esSeleccionada = index == _seleccion;

    Color bg = Colors.white;
    Color border = Colors.grey.shade400;
    Color texto = Colors.black87;
    IconData? icono;

    if (_respondido) {
      if (esCorrecta) {
        bg = Colors.green.shade100;
        border = Colors.green;
        texto = Colors.green.shade900;
        icono = Icons.check_circle;
      } else if (esSeleccionada) {
        bg = Colors.red.shade100;
        border = Colors.red;
        texto = Colors.red.shade900;
        icono = Icons.cancel;
      }
    }

    return InkWell(
      onTap: _respondido ? null : () => _seleccionarOpcion(index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border, width: 2),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: border,
              child: Text(
                String.fromCharCode(65 + index),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                pregunta.options[index],
                style: TextStyle(
                  fontSize: 16,
                  color: texto,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (icono != null) Icon(icono, color: border),
          ],
        ),
      ),
    );
  }

  Widget _pantallaResultados() {
    final max = _preguntas.length;
    final porcentaje = (_puntos / max * 100).round();

    String mensaje;
    IconData icono;
    Color color;
    if (_puntos == max) {
      mensaje = '¡PERFECTO! 🎉';
      icono = Icons.emoji_events;
      color = Colors.amber;
    } else if (_puntos >= (max * 0.6)) {
      mensaje = '¡Muy bien!';
      icono = Icons.thumb_up;
      color = Colors.green;
    } else if (_puntos > 0) {
      mensaje = '¡Sigue practicando!';
      icono = Icons.sentiment_satisfied;
      color = Colors.orange;
    } else {
      mensaje = '¡Inténtalo de nuevo!';
      icono = Icons.sentiment_dissatisfied;
      color = Colors.red;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Icon(icono, size: 90, color: color),
          const SizedBox(height: 16),
          Text(
            mensaje,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.level.title,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            decoration: BoxDecoration(
              color: widget.level.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: widget.level.color, width: 3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'TU NOTA',
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$_puntos',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: widget.level.color,
                        height: 1,
                      ),
                    ),
                    Text(
                      ' / $max',
                      style: TextStyle(
                        fontSize: 24,
                        color: widget.level.color.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                Text(
                  '$porcentaje% de aciertos',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: _reiniciar,
            icon: const Icon(Icons.replay),
            label: const Text('Reintentar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.level.color,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.home),
            label: const Text('Volver al menú de niveles'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
