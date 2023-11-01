import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:second_process/app/modules/home/controllers/home_controller.dart';


class WebviewPage extends GetView<HomeController> {
  const WebviewPage({Key? key}) : super(key: key);
  final String url =
      'https://databasegdriveplayer.xyz/player.php?imdb=tt2395427';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZeePlayer',
      home: WebviewScaffold(
        url: url,
        withZoom: true,
        withLocalStorage: true,
      ),
    );
  }
}
