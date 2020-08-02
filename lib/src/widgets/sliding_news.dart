import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/themes/theme.dart';
import 'package:news_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class SlidingNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService =
        Provider.of<NewsServiceProvider>(context).getArticleByCategory();
    return SlidingSheet(
      elevation: 8,
      cornerRadius: 16,
      snapSpec: const SnapSpec(
        // Enable snapping. This is true by default.
        snap: true,
        // Set custom snapping points.
        snappings: [0.9, 0.1, 1.0],
        // Define to what the snappings relate to. In this case,
        // the total available space that the sheet can expand to.
        // positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      // The body widget will be displayed under the SlidingSheet
      // and a parallax effect can be applied to it.

      builder: (context, state) {
        // This is the content of the sheet that will get
        // scrolled, if the content is bigger than the available
        // height of the sheet.
        return Container(
            height: 600,
            color: theme.accentColor,
            child: (newsService.length == 0)
                ? Center(child: CircularProgressIndicator())
                : ListNewsWidget());
      },

      headerBuilder: (context, state) {
        return Container(
          height: 30,
          width: double.infinity,
          color: Colors.white,
          alignment: Alignment.center,
          child: Text(
            'Latest News',
            style: theme.accentTextTheme.headline1.copyWith(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
