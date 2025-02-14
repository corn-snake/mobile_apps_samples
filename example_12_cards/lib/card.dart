import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(16),
              child: Container(
                width: 600,
                height: 300,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLYe-v6chDv_YVxt9yFY33R1Ca2HBgHFZ5tA&s"), fit: BoxFit.fitHeight)),
                child: Center(child: Text("Hobby: Cantar",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange[600])),),
              ),
            ),
            Card.filled(
              margin: EdgeInsets.all(16),
              child: Container(
                width: 600,
                height: 300,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReCM5WQTPiHXDAhQ6KSDE1LepLzcmfXrl5Lw&s"), fit: BoxFit.fitHeight)),
                  child: Center(
                    child: Text("Comida: Mole", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
              ),
            ),
            Card.outlined(
              margin: EdgeInsets.all(16),
              child: Container(
                width: 600,
                height: 300,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzx6wssT24f3vxB1WJgEX196czMjCJtrnz0w&s"), fit: BoxFit.fitWidth)),
                child: Center(
                  child: Text("Pasión: Naturaleza", style: TextStyle(color: Colors.teal[100]),),
                ),
              ),
            ),
          Card(
            margin: EdgeInsets.all(16),
            child: Container(
              width: 600,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOam7WkjSOEWzbtZ__iHSFljaxHpG5uJqvpA&s"),
                      fit: BoxFit.fitHeight)),
              child: Center(
                child: Text("Cualidad: Minucioso",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange[600])),
              ),
            ),
          ),
          Card.filled(
            margin: EdgeInsets.all(16),
            child: Container(
              width: 600,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG8OudSMKWSYl3TC5WNpkClictF5HAGzuU6w&s"),
                      fit: BoxFit.fitHeight)),
              child: Center(
                child: Text(
                  "Sueño: Salir del país",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          ],
        ),
      ))
    );
  }
}
