import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/themes/theme.dart';
import 'package:provider/provider.dart';

class ButonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actualPosinate = Provider.of<NewsServiceProvider>(context);
    final colorActual = Colors.white;
    final colorActual2 = theme.accentColor;
    return BubbleBottomBar(
      backgroundColor: theme.accentColor,
      opacity: 1,
      currentIndex: actualPosinate.getCurrentIndex,
      // borderRadius: BorderRadius.circular(20),
      elevation: 20,
      fabLocation: BubbleBottomBarFabLocation.center, //new
      hasNotch: true, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Colors.amberAccent,
      onTap: (index) => actualPosinate.setCurrentIndex = index,
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
            backgroundColor: colorActual2,
            icon: FaIcon(FontAwesomeIcons.home),
            activeIcon: FaIcon(
              FontAwesomeIcons.home,
              color: colorActual,
            ),
            title: Text("Home",style: TextStyle(color:Colors.white),)),
        BubbleBottomBarItem(
            backgroundColor: colorActual2,
            icon: FaIcon(
              FontAwesomeIcons.search,
              color: colorActual,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.search,
              color: colorActual,
            ),
            title: Text("Search",style: TextStyle(color:Colors.white),)),
        BubbleBottomBarItem(
            backgroundColor: colorActual2,
            icon: FaIcon(
              FontAwesomeIcons.bookmark,
              color: colorActual,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.bookmark,
              color: colorActual,
            ),
            title: Text("Bookmark",style: TextStyle(color:Colors.white),)),
        BubbleBottomBarItem(
            backgroundColor: colorActual2,
            icon: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/img/avatar.jpg'),
            ),
            activeIcon: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/img/avatar.jpg'),
            ),
            title: Text("Profile"))
      ],
    );
  }
}
