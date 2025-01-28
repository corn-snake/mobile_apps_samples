import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(padding: EdgeInsets.symmetric(horizontal: 45) ,child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Text("Datos personales: ", style: TextStyle(fontSize: 22),),
              TextFormField(decoration: const InputDecoration(icon: Icon(Icons.yard_sharp), label: Text("nombre", style: TextStyle(fontStyle: FontStyle.italic),)), enabled: true),
              TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.account_balance_outlined),
                  label: Text(
                    "apellido",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),
              TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.mail_outline_outlined),
                  label: Text(
                    "e-mail",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),
              TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android_rounded),
                  label: Text(
                    "telefono",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),
              SizedBox(height: 15,),
              Text("Dirección: ", style: TextStyle(fontSize: 22),),
              TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.house),
                  label: Text(
                    "Calle y Numero [e interior]",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.near_me),
                  label: Text(
                    "Colonia",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),
              TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.other_houses_sharp),
                  label: Text(
                    "Localidad",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),
              TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.line_axis),
                  label: Text(
                    "Estado",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),
              TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.pending_actions),
                  label: Text(
                    "CP",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              enabled: true),
              ElevatedButton.icon(onPressed: ()=>showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Aviso:"),
                      content: Text("Registro Exitoso!"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Ok"))
                      ],
                    );
                  }), label: Text("hoooo"))
            ]
          )),
          backgroundColor: Color.fromARGB(255, 185, 216, 217),
          appBar: AppBar(
            centerTitle: true,
            title: Text("txt"),
            backgroundColor: Color.from(alpha: 1, red: 15, green: 240, blue: 33),
          ),
        );
  }
}