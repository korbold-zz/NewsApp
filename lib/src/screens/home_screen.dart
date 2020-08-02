import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/themes/theme.dart';
import 'package:news_app/src/widgets/buton_bar.dart';
import 'package:news_app/src/widgets/categories_menu.dart';
import 'package:news_app/src/widgets/sliding_news.dart';
import 'package:news_app/src/widgets/swiper_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService =
        Provider.of<NewsServiceProvider>(context).getArticleByCategory();
    return Scaffold(
        backgroundColor: theme.accentColor,
        appBar: AppBar(
            backgroundColor: theme.accentColor,
            elevation: 0,
            centerTitle: true,
            leading: Icon(Icons.menu),
            title: Text(
              'Grands News ',
              style: theme.accentTextTheme.headline2,
            ),
            actions: [
              Icon(Icons.notifications_active),
            ]),
        bottomNavigationBar: ButonBar(),
        body: Stack(
          children: <Widget>[
            CategoriesMenu(),
            (newsService.length == 0)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SwiperCard(
                    news: newsService,
                  ),
            // NewsMore(),
            SlidingNews(),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
