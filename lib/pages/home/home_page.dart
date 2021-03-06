import 'package:flutter/material.dart';
import 'package:navin_learn/pages/categoryArticles/category_article.dart';
import '../../network/http_service.dart';
import 'package:navin_learn/models/Article.dart';
import 'package:navin_learn/models/category.dart';
import 'package:navin_learn/pages/articleDetail/article_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Article>> latest_articles = HttpService().getLatestArticles();

  Future<List<Category>> categoryList = HttpService().getCateoryList();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Navin Learn'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
          child: Column(
            children: [
              FutureBuilder<List<Category>>(
                future: categoryList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 199,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (snapshot.hasData) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryArticles(
                                            category: snapshot.data[index])));
                              },
                              child: Container(
                                  height: 199,
                                  width: 344,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    margin: EdgeInsets.all(14),
                                    child: Stack(children: [
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          width: 100.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot
                                                    .data[index]
                                                    .category_image)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18.0)),
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  )),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
              Text(
                'Latest Update',
                style: TextStyle(fontSize: 28),
              ),
              FutureBuilder<List<Article>>(
                future: latest_articles,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        height: height - 100,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                                child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ArticleDetail(
                                            article: snapshot.data[index])));
                              },
                              child: Container(
                                  child: Card(
                                margin: EdgeInsets.all(14),
                                child: Container(
                                  padding: EdgeInsets.all(14),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${snapshot.data[index].mp3_title}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.network(
                                            snapshot
                                                .data[index].mp3_thumbnail_b,
                                            width: 100,
                                            height: 100,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.share),
                                            color: Colors.red,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ));
                          },
                        ));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
