import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentindex = 0;
  final screens = [
    const Center(
      child: Text(
        'About Me',
        style: TextStyle(fontSize: 30),
      ),
    ),
    Center( child: SingleChildScrollView( child: Column( children: [
      Text(
        'Mis Hobbies',
        style: TextStyle(fontSize: 30),
      ),
      Text("• Leer"),
      Text("• Cocinar"),
      Text("• Dibujar"),
      Text("• Jardinería")
    ]))),
    Center(
      child: SingleChildScrollView( child: Column(
        children: [
          Text(
            'Receta para pasta quesosa',
            style: TextStyle(fontSize: 30),
          ),
          Image.network("https://tse2.mm.bing.net/th?id=OIP.FrJZKa8JzYQOrm2cZ41oAQHaE6&pid=Api"),
          Text("1. Tostar pasta con poquito aceite (máx. media cucharadita por taza) en una olla por 5-7 min.s para evitar que se pegue, removiendo constantemente"),
          Text("2. Añadir agua, aprox. 1.5 veces el volumen de la pasta"),
          Text("3. Hervir hasta que se consuma la mitad del agua, removiendo constantemente"),
          Text("4. Sin apagar el fuego, añadir un cuarto de taza de leche, ya sea vegetal o animal"),
          Text("5. Añadir tres cuartos de cucharada de matequilla, y mezclar"),
          Text("6. Habiéndose reducido un poco, añadir una cucharada y cuarto de queso crema, e integrar"),
          Text("7. Añadir queso al gusto, e integrar")
        ],
      )),
    ),
    Center(
      child: SingleChildScrollView( child: Column( children:[
        Text(
          'Bosque',
          style: TextStyle(fontSize: 30),
        ),
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzx6wssT24f3vxB1WJgEX196czMjCJtrnz0w&s"),
        Text("Bosque :)")
    ])))
  ];
  final colors = [Colors.amber, Colors.greenAccent, Colors.purple, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Home'),
        centerTitle: true,
        backgroundColor: colors[_currentindex],
      ),
      body: screens[_currentindex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(bottom: 5),
        child: GNav(
          backgroundColor: colors[_currentindex],
          selectedIndex: _currentindex,
          onTabChange: (index) => {setState(() => _currentindex = index)},
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'HOME',
              iconActiveColor: Colors.white,
              textColor: Colors.pink,
            ),
            GButton(
              icon: Icons.hourglass_bottom,
              text: 'Hobbies',
            ),
            GButton(
              icon: Icons.post_add_sharp,
              text: 'Receta',
            ),
            GButton(
              icon: Icons.travel_explore,
              text: 'Bosque',
            )
          ],
        ),
      ),
    );
  }
}