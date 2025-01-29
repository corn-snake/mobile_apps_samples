import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

final buttonStyleElev = ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.cyan),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white60)),
    buttonStyleTex = ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.black54),
        foregroundColor: WidgetStatePropertyAll<Color>(Colors.cyanAccent));

Future<dynamic> Function() confirmDialog (String txt, BuildContext context) => ()=>showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("weeeeeeee"),
                              content: Text("txt"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Ok"))
                              ],
                            );
                          });

class Home extends StatelessWidget {
  const Home({super.key});
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("AAAAAAAAAAAAAAAAAAAAAAAAA",
            style: TextStyle(color: Colors.white70)),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: confirmDialog("sampletext", context),
                    style: buttonStyleTex,
                    icon: Icon(Icons.fireplace_outlined),
                    label: Text("buttonup1"),
                  ),
                  const SizedBox(width: 10.0, height: 10.0),
                  ElevatedButton(
                    onPressed: confirmDialog("sampletext", context),
                    style: buttonStyleElev,
                    child: Text("upbutton2"),
                  ),
                ]),
            Wrap(alignment: WrapAlignment.center, children: [
              Text("here be buttons"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: confirmDialog("sampletext", context),
                    style: buttonStyleElev,
                    child: Text("ceci n'est pas un boton"),
                  ),
                  const SizedBox(width: 10.0, height: 10.0),
                  TextButton(
                      onPressed: confirmDialog("sampletext", context),
                      style: buttonStyleTex,
                      child: const Text("textextext"))
                ],
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: confirmDialog("sampletext", context),
                  style: buttonStyleTex,
                  child: Text("buttondown1"),
                ),
                const SizedBox(width: 10.0, height: 10.0),
                ElevatedButton(
                  onPressed: confirmDialog("sampletext", context),
                  style: buttonStyleElev,
                  child: Wrap(
                    children: [
                      Text("downbutton2"),
                      const SizedBox(width: 10.0, height: 10.0),
                      Icon(Icons.ac_unit)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}