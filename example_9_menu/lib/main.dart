import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menú Lateral en Flutter")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: const Color.fromARGB(255, 5, 72, 127)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Luis P",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text("eduardopa.ti23@utsjr.edu.mx",
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
              onTap: () {
                Navigator.pop(context); // Cierra el menú //
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configuración"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // Línea separadora //
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Cerrar sesión"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text("buenas lonches")),
    );
  }
}
