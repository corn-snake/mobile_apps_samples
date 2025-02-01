import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  final String txt;
  const StatefulPage(this.txt, {super.key});

  @override
  State<StatefulPage> createState() => _StateStatefulPage();
}

class _StateStatefulPage extends State<StatefulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenid@, ${widget.txt}"),
        titleTextStyle: TextStyle(
            fontFamily: "IMFellFrenchCanon", fontWeight: FontWeight.w800),
        backgroundColor: Colors.amber[100],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 42),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Conóceme:", style: TextStyle(fontFamily: "IMFellEnglish", fontSize: 35, fontStyle: FontStyle.italic)),
              SizedBox(
                height: 683 / 2,
                width: 512 / 2,
                child: Image.network("https://milrecetas.net/wp-content/uploads/2017/09/Mole-poblano-receta-3.jpg"),
              ),
              Text("Me gusta la naturaleza, el mole poblano chocolatado y la plata (el metal, aunque el dinero también). Tengo 19 y tres cuartos años, y vivo en la Zona Oriente de San Juan del Río, Querétaro.")
              ],
          )),
    );
  }
}
