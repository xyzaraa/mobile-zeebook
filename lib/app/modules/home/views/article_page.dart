import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:second_process/app/modules/home/controllers/api_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: fromApi(),
    );
  }
}

class fromApi extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (apiController.jsonData.isEmpty) {
            return CircularProgressIndicator();
          } else {
            final data = apiController.jsonData;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User ID: ${data['userId']}'),
                Text('ID: ${data['id']}'),
                Text('Title: ${data['title']}'),
                Text('Completed: ${data['completed']}'),
              ],
            );
          }
        }),
      ),
    );
  }
}
