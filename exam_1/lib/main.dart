import 'package:exam_1/pages/fore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}



class Home extends StatelessWidget {
  final TextEditingController txtCont = TextEditingController();
  Home({
    super.key,
  });

  Future<dynamic> Function() confirmDialog(BuildContext context) =>
    () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Bienvenid@"),
            content: Text("¿List@ para comenzar?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StatefulPage(txtCont.text)));
                  },
                  child: Text("Sí"))
            ],
          );
        });
        Future<dynamic> Function() egg(BuildContext context) =>
      () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("EasterEgg"),
              content: Text("Egg"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.egg))
              ],
            );
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: egg(context), icon: Icon(Icons.egg)), title: Text("My App — Luis"), titleTextStyle: TextStyle(fontFamily: "IMFellFrenchCanon", fontWeight: FontWeight.w800), backgroundColor: Colors.amber[100],),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 683 / 2,
              width: 512 / 2,
              child: Image.network("https://inaturalist-open-data.s3.amazonaws.com/photos/176605112/original.jpg"),
            ),
            Text("Cuéntame de tí...", style: TextStyle(fontFamily: "IMFellEnglish", fontStyle: FontStyle.italic)),
            TextFormField(
              decoration: InputDecoration(icon: Icon(Icons.person_2_rounded), label: Text("Nombre")),
              controller: txtCont,
            ),
            TextFormField(decoration: InputDecoration(icon: Icon(Icons.phone), label: Text("# de Tel."))),
            TextFormField(decoration: InputDecoration(icon: Icon(Icons.map_outlined), label: Text("Dirección"))),
            ElevatedButton.icon(onPressed: confirmDialog(context), label: Text("Adelante"), icon: Icon(Icons.arrow_circle_right_outlined), iconAlignment: IconAlignment.end, style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.lightGreen[700]), foregroundColor: WidgetStatePropertyAll(Colors.white70)),)
          ],
        ),
      ),
    );
  }
}
