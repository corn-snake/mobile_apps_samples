import 'dart:convert';
import 'package:http/http.dart' as http;

const String url = "https://dog.ceo/api/breeds/image/random/7";

class Dog {
  final String image;

  Dog({
    required this.image
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      image: json["message"]
    );
  }
}

class ApiService {

  Future<List<Dog>> fetchDogs() async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data["status"] == "success") {
        List<dynamic> results = data['message'];
        List<Dog> dogs= results.map((json) =>Dog(image: json)).toList();
        return dogs;
      } else {
        return [];
      }
    } else {
      throw Exception("Error al cargar perros");
    }
  }
}
