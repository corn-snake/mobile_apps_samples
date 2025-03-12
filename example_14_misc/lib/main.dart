import 'package:example_14_misc/api/api.dart';
import 'package:example_14_misc/dorg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}

Scaffold Home()=>Scaffold(
    body: Center(
      child: Body(),
    ),
  );

Expanded Body() => Expanded(child: Padding(padding: EdgeInsets.all(20), child: Wrap(children: [
  Column(),
  Column(children: [DogPen()]),
  Column()
],)));

class DogPen extends StatefulWidget {
  const DogPen({super.key});
  @override
  State<StatefulWidget> createState() => _DogPen();
}

class _DogPen extends State<DogPen> {
  late Future<List<Dog>> futureDogs;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureDogs = apiService.fetchDogs(); 
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Dog>>(future: futureDogs, builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text("Error: ${snapshot.error}"));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text("No se encontraron perros"));
    } else {
      /*return ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          Dog dog = snapshot.data![index];
          return MovieCard(movie: movie);
        },
      );*/
      return Container(width: 400, height: 500, child: peghos(snapshot.data!));
    }
  });
}