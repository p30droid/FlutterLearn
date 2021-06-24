import 'dart:convert';

import 'package:http/http.dart';
import 'package:navin_learn/models/Article.dart';
import 'package:navin_learn/models/category.dart';

class JsonConvertor {
  List<Article> articlesList(String body) {
    final parsed = jsonDecode(body).cast<Map<String, dynamic>>();
    return parsed.map<Article>((json) => Article.fromJson(json)).toList();
  }

  List<Category> getCategories(String respons) {
    List<Category> categoryList = new List();

    dynamic jsonParsed = json.decode(respons);
    List array = jsonParsed;

    array.forEach((element) {
      Map obj = element;

      String id = obj['cid'];
      String category_name = obj['category_name'];
      String category_image = obj['category_image'];
      String category_image_thumb = obj['category_image_thumb'];

      categoryList.add(new Category(
          id, category_name, category_image, category_image_thumb));
    });

    return categoryList;
  }

  List<Article> articles(String response) {
    List<Article> list = new List();

    //  List array = response as List;
    dynamic jsonParsed = json.decode(response);

    List array = jsonParsed;

    array.forEach((element) {
      Map obj = element;

      String id = obj['id'];

      String cat_id = obj['cat_id'];
      String mp3_type = obj['mp3_type'];
      String mp3_title = obj['mp3_title'];
      String mp3_url = obj['mp3_url'];
      String mp3_thumbnail_b = obj['mp3_thumbnail_b'];
      String mp3_thumbnail_s = obj['mp3_thumbnail_s'];
      String mp3_duration = obj['mp3_duration'];
      String mp3_artist = obj['mp3_artist'];
      String mp3_description = obj['mp3_description'];

      list.add(new Article(
          id: id,
          cat_id: cat_id,
          mp3_type: mp3_type,
          mp3_title: mp3_title,
          mp3_url: mp3_url,
          mp3_thumbnail_b: mp3_thumbnail_b,
          mp3_thumbnail_s: mp3_thumbnail_s,
          mp3_duration: mp3_duration,
          mp3_artist: mp3_artist,
          mp3_description: mp3_description));
    });

    return list;
  }
}
