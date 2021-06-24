

import 'package:flutter/material.dart';
import 'package:navin_learn/models/Article.dart';

class ArticleDetail extends StatefulWidget {

  final Article article;

  ArticleDetail({Key key , @required this.article}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {


  Article article;

  _ArticleDetailState({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        children: [

          Text(widget.article.mp3_title)

        ],


      ),

    );
  }
}
