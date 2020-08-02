import 'package:flutter/material.dart';
import 'package:news_app/src/models/categories_models.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/themes/theme.dart';
import 'package:provider/provider.dart';

class CategoriesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ListHorizontal());
  }
}

class ListHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServiceProvider>(context).categories;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return ButomCategory(category: categories[index]);
      },
    );
  }
}

class ButomCategory extends StatelessWidget {
  final Category category;

  const ButomCategory({this.category});

  @override
  Widget build(BuildContext context) {
    final categoriesSelect = Provider.of<NewsServiceProvider>(context);

    final nameCategory = category.name;
    return GestureDetector(
      onTap: () {
        Provider.of<NewsServiceProvider>(context, listen: false)
            .setSelectedCategory = category.name;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          '${nameCategory[0].toUpperCase()}${nameCategory.substring(1)}',
          style: (categoriesSelect.getSelectedCategory == category.name)
              ? theme.textTheme.headline2
                  .copyWith(fontSize: 26, color: Colors.white)
              : theme.textTheme.headline2
                  .copyWith(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
