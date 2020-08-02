import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/themes/theme.dart';

class MoreDetaill extends StatelessWidget {
  final String category;
  final Article news;
  const MoreDetaill({Key key, this.category, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pading = EdgeInsets.symmetric(horizontal: 20, vertical: 5);
    return Scaffold(
      backgroundColor: theme.accentColor,
      appBar: AppBar(
        backgroundColor: theme.accentColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: pading,
                  child: Text(
                    'Politics',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: pading,
                  child: Text(
                    news.title,
                    style: theme.accentTextTheme.headline2.copyWith(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: pading,
                  child: Text(
                      DateFormat.yMMMd().format(news.publishedAt).toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
                Container(
                  height: 240,
                  child: Stack(children: [
                    Center(
                      child: Image.network(
                        news.urlToImage,
                        width: double.infinity,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ButonItems(
                            icon: FontAwesomeIcons.bookmark,
                          ),
                          ButonItems(
                            icon: FontAwesomeIcons.share,
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/img/avatar.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: <Widget>[
                          Text(news.author),
                          Text(
                            'Author',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: news.content != null
                      ? Text(
                          news.content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 8,
                        )
                      : Center(
                          child: Text(
                          'Content Empty',
                          style: TextStyle(fontSize: 30),
                        )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButonItems extends StatelessWidget {
  final IconData icon;
  const ButonItems({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 20,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FaIcon(
              icon,
              color: Colors.black,
            ),
          )),
    );
  }
}
