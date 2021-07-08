import 'package:flutter/material.dart';
import 'package:navin_learn/models/Article.dart';
import 'package:navin_learn/models/category.dart';
import 'package:navin_learn/network/http_service.dart';
import 'package:navin_learn/pages/articleDetail/article_detail.dart';

class CategoryArticles extends StatefulWidget {
  final Category category;

  CategoryArticles({Key key, @required Category this.category})
      : super(key: key);

  @override
  _CategoryArticlesState createState() => _CategoryArticlesState();
}

class _CategoryArticlesState extends State<CategoryArticles> {
  Category category;

  _CategoryArticlesState({this.category});

  Future<List<Article>> articleList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    articleList = HttpService().getArticlesById(widget.category.cid);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('${widget.category.category_name}'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Article>>(
          future: articleList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: height - 100,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 199,
                      width: 344,
                      child: GestureDetector(

                        onTap: () {


                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleDetail(
                                      article: snapshot.data[index])));

                        },


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
                                    image: NetworkImage(
                                        snapshot.data[index].mp3_thumbnail_b)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18.0)),
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 50,
                              right: 50,
                              child: Text(
                                '${snapshot.data[index].mp3_title}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ))
                        ]),
                      )),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    ));
  }
}
