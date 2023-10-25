import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/modules/home/controllers/home_controller.dart';
import 'package:second_process/app/modules/home/models/tryin.dart';

class ArticlePage extends GetView<HomeController> {
  final Article article;
  const ArticlePage({
    Key ? key,
    required this.article
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Hero(
            tag: article.urlToImage!,
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.network(
                article.urlToImage!,
              ),
            ),
          ),
          title: Text(
            article.title,
          ),
          subtitle: Text(article.author ?? ''),
          onTap: () => Navigator.pushNamed(
            context,
            article.title,
            arguments: article,
          ),
      ),
    );
  }
}