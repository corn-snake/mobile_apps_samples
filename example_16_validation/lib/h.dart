import 'package:flutter/material.dart';
import 'package:validacion/wdg/form.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("validación de formulario"), centerTitle: true, backgroundColor: Colors.lime[300],),
      body: Formulario(),
    );
  }
}
