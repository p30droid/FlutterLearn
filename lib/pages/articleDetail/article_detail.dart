

import 'package:flutter/material.dart';
import 'package:navin_learn/models/Article.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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

      appBar: AppBar(


        title: Text('${widget.article.mp3_title}'),
      ),


      body: SingleChildScrollView(

        child:

         HtmlWidget(widget.article.mp3_description)
        ,


      ),

    );
  }
}
