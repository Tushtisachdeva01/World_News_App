import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;


class News {
  List<ArticleModel> news = [];
  Future<void> getNews(String country) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            urlToImage: element["urlToImage"],
            title: element["title"],
            publishedAt: element["publishedAt"],
            description: element["description"],
            content: element["content"],
            url: element["url"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
// class CountryNews {
//   List<CountryModel> country = [];
//   Future<void> getNews(String country) async {
//     String url =
//         "http://newsapi.org/v2/top-headlines?country=country&apiKey=$API_KEY";

//     var response = await http.get(url);
//     var jsonData = jsonDecode(response.body);
//     if (jsonData["status"] == "ok") {
//       Navigator.push(
//           null,
//           MaterialPageRoute(
//               builder: (context) => HomePage(),
//         ),);
//     }
//   }
// }
class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=$API_KEY";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            urlToImage: element["urlToImage"],
            title: element["title"],
            publishedAt: element["publishedAt"],
            description: element["description"],
            content: element["content"],
            url: element["url"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
