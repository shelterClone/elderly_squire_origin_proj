import 'package:elderly_squire_capstone/HomePage2.dart';
import 'package:elderly_squire_capstone/news/helper/news.dart';
import 'package:elderly_squire_capstone/news/models/article_model.dart';
import 'package:elderly_squire_capstone/news/views/article_view.dart';
import 'package:flutter/material.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});


  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();

  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text("Ur"),
//            Text(" Squire",
//                style: TextStyle(
//                  color: Colors.orangeAccent,
//                ))
//          ],
//        ),
//        actions: <Widget>[
//          Opacity(
//            opacity: 0,
//            child: Container(
//                padding: EdgeInsets.symmetric(horizontal:16),
//                child: Icon(Icons.save)),
//          )
//        ],
//        centerTitle: true,
//        elevation: 0.0,
//      ),
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.blueGrey[900],
        title: Container(
          margin: EdgeInsets.only(left: 65),
          child: Row(
            children: <Widget>[
              Image.asset('assets/images/elderly_squire_logo_classic_icon.png',
                  height: 40, width: 125),
            ],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home2()),
            );
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),


      body: _loading ? Center(
        child: Container(

          child: CircularProgressIndicator(),
        ),
      ) :SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
//                  padding: EdgeInsets.only(top: 16),
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
                        );
                      }))
            ],
          ),
        ),
      ),


    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl, this.title, this.desc, @required this.url});

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
                child: Image.network(imageUrl)),
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
