import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:second_process/app/modules/home/controllers/home_controller.dart';

void main() => runApp(WebviewPage());

class WebviewPage extends GetView<HomeController> {
  const WebviewPage({Key? key}) : super(key: key);
  final String url =
      'https://databasegdriveplayer.xyz/player.php?imdb=tt2395427';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Example',
      home: WebviewScaffold(
        url: this.url,
        withZoom: true,
        withLocalStorage: true,
      ),
    );
  }
}
