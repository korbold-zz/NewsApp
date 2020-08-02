import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/screens/detaill_screen.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/themes/theme.dart';
import 'package:provider/provider.dart';

class ListNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService =
        Provider.of<NewsServiceProvider>(context).getArticleByCategory();
    return ListView.builder(
        itemCount: newsService.length,
        itemBuilder: (BuildContext context, int index) {
          return _ItemNew(
            news: newsService[index],
          );
        });
  }
}

class _ItemNew extends StatelessWidget {
  final Article news;

  const _ItemNew({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = 120;
    final double width = 100;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MoreDetaill(
                    news: news,
                  ))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: (news.urlToImage == null)
                  ? Image(
                      image: AssetImage(
                        'assets/empty.jpg',
                      ),
                      fit: BoxFit.fill,
                      height: height,
                      width: width,
                    )
                  : FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/loading.gif'),
                      image: NetworkImage(news.urlToImage),
                      height: height,
                      width: width,
                    ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    news.title,
                    style:
                        theme.accentTextTheme.headline2.copyWith(fontSize: 16),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20,),
                  Text(DateFormat.yMMMd().format(news.publishedAt).toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
