import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: fromApi(),
    );
  }
}

class fromApi extends StatelessWidget {
  Future<Map<String, dynamic>> _loadApis() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));

    if (response.statusCode == 200) {
      final jsonString = response.body;
      final jsonData = json.decode(jsonString);
      return jsonData;
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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadApis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('User ID: ${data['userId']}'),
                    Text('ID: ${data['id']}'),
                    Text('Title: ${data['title']}'),
                    Text('Completed: ${data['completed']}'),
                  ],
                ),
              );
            } else {
              return Center(child: Text('No data available'));
            }
          }
        },
      ),
    );
  }
}
