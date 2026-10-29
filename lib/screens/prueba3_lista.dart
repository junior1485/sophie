import 'package:flutter/material.dart';

class Prueba3Lista extends StatelessWidget {
  const Prueba3Lista({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = List.generate(20, (i) => 'Elemento número ${i + 1}');
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba 3 - Lista')),
      body: ListView.separated(
        itemCount: datos.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: CircleAvatar(child: Text('${i + 1}')),
          title: Text(datos[i]),
          subtitle: const Text('Descripción de prueba'),
        ),
      ),
    );
  }
}
