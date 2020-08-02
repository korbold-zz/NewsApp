import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/themes/theme.dart';

class SwiperCard extends StatelessWidget {
  final List<Article> news;
  const SwiperCard({
    Key key,
    this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height/1.65,
      margin: EdgeInsets.only(top: 40),
      child: Swiper(
        itemCount: 10,
        itemBuilder: (
          context,
          index,
        ) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  color: Colors.blueGrey,
                  child: (news[index].urlToImage == null)
                      ? Image(
                          image: AssetImage('assets/empty.jpg'),
                          fit: BoxFit.fill)
                      : FadeInImage(
                          fit: BoxFit.fill,
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage(news[index].urlToImage)),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(3, 3),
                            blurRadius: 80)
                      ]),
                      child: Text(
                        news[index].title,
                        style: theme.accentTextTheme.headline2
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.left,
                      )),
                ),
              ],
            ),
          );
        },
        layout: SwiperLayout.STACK,
        itemWidth: media.width / 1.5,
        // itemHeight: 300,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
