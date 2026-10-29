import 'package:flutter/material.dart';

class Prueba1Contador extends StatefulWidget {
  const Prueba1Contador({super.key});

  @override
  State<Prueba1Contador> createState() => _Prueba1ContadorState();
}

class _Prueba1ContadorState extends State<Prueba1Contador> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba 1 - Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Has pulsado:', style: TextStyle(fontSize: 18)),
            Text(
              '$contador',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() => contador--),
                  icon: const Icon(Icons.remove),
                  label: const Text('Restar'),
                ),
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: () => setState(() => contador++),
                  icon: const Icon(Icons.add),
                  label: const Text('Sumar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
