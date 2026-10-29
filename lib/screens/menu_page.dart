import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../routes.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const <MenuItem>[
      /*MenuItem(
        titulo: 'Prueba 1 - Contador',
        icono: Icons.add_circle,
        color: Colors.blue,
        ruta: AppRoutes.prueba1,
      ),
      MenuItem(
        titulo: 'Prueba 2 - Formulario',
        icono: Icons.edit,
        color: Colors.green,
        ruta: AppRoutes.prueba2,
      ),
      MenuItem(
        titulo: 'Prueba 3 - Lista',
        icono: Icons.list,
        color: Colors.orange,
        ruta: AppRoutes.prueba3,
      ),
      MenuItem(
        titulo: 'Prueba 4 - Colores',
        icono: Icons.palette,
        color: Colors.purple,
        ruta: AppRoutes.prueba4,
      ),
      MenuItem(
        titulo: 'Prueba 5 - Animación',
        icono: Icons.animation,
        color: Colors.red,
        ruta: AppRoutes.prueba5,
      ),*/
      MenuItem(
        titulo: 'Picture Game',
        icono: Icons.image_search,
        color: Colors.deepOrange,
        ruta: AppRoutes.picturegame,
      ),
      MenuItem(
        titulo: 'Juego de Inglés',
        icono: Icons.school,
        color: Color(0xffbf7e0f),
        ruta: AppRoutes.english,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Dalila'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item.color,
                child: Icon(item.icono, color: Colors.white),
              ),
              title: Text(
                item.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // 👇 Navegación por nombre
                Navigator.pushNamed(context, item.ruta);
              },
            ),
          );
        },
      ),
    );
  }
}
