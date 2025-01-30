import 'package:example_6_navigation/pages/stateful.dart';
import 'package:example_6_navigation/pages/stateless.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home ({
    super.key,
  });

  final TextEditingController txtCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("título"), backgroundColor: Colors.teal, foregroundColor: Colors.white70,),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 42, horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              controller: txtCont,
              decoration: InputDecoration(
                icon: Icon(Icons.text_fields_sharp),
                border: InputBorder.none,
                fillColor: Colors.grey[100],
                filled: true,
                hintText: "sdfghjokl;pkojihgiuyuftdyrzdfxbv nm,"
              ),
            ),
            ElevatedButton.icon(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StatelessPage(txtCont.text))), label: Text("stateless submit"), icon: Icon(Icons.add_comment_sharp)),
            ElevatedButton.icon(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StatefulPage(txtCont.text))), label: Text("stately submit"), icon: Icon(Icons.arrow_circle_right_outlined))
          ],
        ),
      ),
    );
  } 
}
