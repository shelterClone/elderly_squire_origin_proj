import 'dart:convert';
import 'package:elderly_squire_capstone/news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=ph&category=general&apiKey=84a739ffc7cd43748a066d980dada246";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articlemodel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
//            publishAt: element["publishAt"],
            content: element["content"],
          );

          news.add(articlemodel);
      }
    });
  }
}

}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?category=$category&country=ph&apiKey=84a739ffc7cd43748a066d980dada246";

//    String url = "https://newsapi.org/v2/top-headlines?&country=ph&category=$category&apiKey=84a739ffc7cd43748a066d980dada246";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articlemodel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element["url"],
            urlToImage: element["urlToImage"],
//            publishAt: element["publishAt"],
            content: element["content"],
          );

          news.add(articlemodel);
        }
      });
    }
  }

}

