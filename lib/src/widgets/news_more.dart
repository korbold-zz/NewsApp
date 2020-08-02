import 'package:flutter/material.dart';
import 'package:news_app/src/themes/theme.dart';

class NewsMore extends StatelessWidget {
  const NewsMore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      // heightFactor: 400,
      // alignment: Alignment.centerLeft,
      child: Container(
          child: Row(
        children: <Widget>[
          Text(
            'Latest News',
            style: theme.accentTextTheme.headline2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
          ),
          Text(
            'See More',
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          )
        ],
      )),
    );
  }
}
