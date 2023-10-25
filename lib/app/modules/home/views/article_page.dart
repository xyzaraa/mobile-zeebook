import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:second_process/app/modules/home/controllers/home_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: fromApi(),
    );
  }
}



class fromApi extends GetView<HomeController>  {
  Future<List<Map<String, dynamic>>> _loadApis() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));

    if (response.statusCode == 200) {
      final jsonString = response.body;
      final jsonData = json.decode(jsonString);
      List<Map<String, dynamic>> resultApi = [];

      for (var key in jsonData.keys) {
        resultApi.add({key: jsonData[key]});
      }

      return resultApi;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _loadApis(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.hasData) {
                final data = snapshot.data![0];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('User ID: ${data['userId']}'),
                    Text('ID: ${data['id']}'),
                    Text('Title: ${data['title']}'),
                    Text('Completed: ${data['completed']}'),
                  ],
                );
              } else {
                return Text('No data available');
              }
            }
          },
        ),
      ),
    );
  }
}