import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  var jsonData = {}.obs;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));

    if (response.statusCode == 200) {
      final jsonString = response.body;
      jsonData.value = json.decode(jsonString);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
