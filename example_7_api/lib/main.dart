import 'package:flutter/material.dart';
import 'api_service.dart';
import 'movie_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMDb Movies',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> futureMovies;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureMovies = apiService.fetchMovies("Batman", 2); // Buscar "Batman" en la página 2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Películas de Batman")),
      body: FutureBuilder<List<Movie>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No se encontraron películas"));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Movie movie = snapshot.data![index];
                return MovieCard(movie: movie);
              },
            );
          }
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: movie.poster.isNotEmpty
            ? Image.network(movie.poster, width: 50, fit: BoxFit.cover)
            : Icon(Icons.movie, size: 50),
        title: Text(movie.title),
        subtitle: Text("Año: ${movie.year}"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Aquí podrías navegar a una pantalla de detalles
        },
      ),
    );
  }
}