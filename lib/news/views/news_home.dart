import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:elderly_squire_capstone/news/helper/data.dart';
import 'package:elderly_squire_capstone/news/helper/news.dart';
import 'package:elderly_squire_capstone/news/models/article_model.dart';
import 'package:elderly_squire_capstone/news/models/category_model.dart';
import 'package:elderly_squire_capstone/news/views/article_view.dart';
import 'category_news.dart';


class NewsHome extends StatefulWidget {

  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text("Elderly"),
//              Text(" Squire",
//                  style: TextStyle(
//                    color: Colors.orangeAccent,
//                  ))
//            ],
//          ),
//          centerTitle: true,
//          elevation: 0.0,
//        ),
        body: _loading? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  margin:EdgeInsets.only(top:15),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[


                      //Category
                      Container(
//                padding: EdgeInsets.symmetric(horizontal:16),
                        height: 70,
                        child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),

                      //Blogs
                      Container(
                          padding: EdgeInsets.only(top: 16),
                          child: ListView.builder(
                              itemCount: articles.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BlogTile(
                                  imageUrl: articles[index].urlToImage,
                                  title: articles[index].title,
                                  desc: articles[index].description,
                                  url: articles [index].url,
//                                  publishAt: articles [index].publishAt,

                                );
                              }))
                    ],
                  ),
                ),
              )
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder:(context)=> CategoryNews
          (category: categoryName.toString().toLowerCase()),

        ));
      },
      child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Stack(children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                ),
                child: Text(
                  categoryName,
                  style: TextStyle(color: Colors.white),
                ))
          ])),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url, publishAt;
  BlogTile({@required this.imageUrl, this.title, this.desc, @required this.url, @required this.publishAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(
        blogUrl: url,
      )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),

        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child:
                Image.network(
                    imageUrl)
            ),

            Text(title,
            style:TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500
            )),
            SizedBox(
              height: 8,

            ),
            Text(desc,
            style:TextStyle(
              color: Colors.black26
            )),
          ],
        ),
      ),
    );
  }
}
