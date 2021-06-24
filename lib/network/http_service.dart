import 'package:http/http.dart';
import 'package:navin_learn/models/Article.dart';
import 'package:navin_learn/models/category.dart';
import 'package:navin_learn/network/jsonConvertor.dart';
import 'package:navin_learn/utility/Constnts.dart';
import 'package:navin_learn/utility/utility.dart';

class HttpService {


  Future<List<Article>> getLatestArticles ()  async{


    Response response = await get(Uri.parse(Constants.LATEST_URL) );


    print(response.statusCode);
    List<Article> articleList =  JsonConvertor().articles(response.body);

    //JsonConvertor().articles(response.body);

    return articleList;
  }

  Future<List<Category>> getCateoryList () async {


    Response response = await get(Uri.parse(Constants.CATEGORY_LIST_URL));

    print(response);


    List<Category> categoryList = JsonConvertor().getCategories(response.body);


    return categoryList;

  }


}