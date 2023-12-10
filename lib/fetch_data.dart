import 'dart:convert'; //melakukan decode atau encode
import 'package:gudang/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:gudang/models/product.dart';


class Repository {
  final String apiUrl =
      "https://restapifirebase-719f9-default-rtdb.firebaseio.com/gudang.json";

  Future<List<Product>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Product> dataPlaces;
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> jsonData = json.decode(response.body);
      // print(jsonData);
      dataPlaces = jsonData.values.map((value) {
        return Product.fromJson(value);
      }).toList();
      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}
