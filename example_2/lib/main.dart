import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IMFellEnglish'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('textextextextext', style: TextStyle(color: Colors.white70)),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("wssssssssssssssssssssssss", style: TextStyle(fontFamily: "IMFellFrenchCanon", fontSize: 25, color: Color.from(alpha: 1, red: 192, green: 192, blue: 192), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              SizedBox(
                height: 300,
                width: 250,
                child: Image.network("https://sites.create-cdn.net/siteimages/33/9/0/339076/10/2/4/10248377/1955x2000.jpg"),
              ),
              Text.rich(
                TextSpan(
                  text: "Elegí esta imagen por mi gusto personal por el ",
                  children: const <TextSpan>[
                    TextSpan(
                      text: "Art Decó",
                      style: TextStyle(fontFamily: "IMFellFrenchCanon", fontStyle: FontStyle.italic)
                    ),
                    TextSpan(text: ", así como la combinación de colores particular. Las tipografías son "),
                    TextSpan(text: "IM Fell English", style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: " y "),
                    TextSpan(
                        text: "IM Fell French Canon",
                        style: TextStyle(fontFamily: "IMFellFrenchCanon",fontStyle: FontStyle.italic)),
                    TextSpan(
                      text: ".",
                      style: TextStyle(fontStyle: FontStyle.italic))
                  ]
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
