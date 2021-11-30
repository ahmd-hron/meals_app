import 'package:flutter/material.dart';

import '../models/category.dart';
import '../Pages/category_meals_page.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) => CategoryMealPage(category.name, category.id),
    //     fullscreenDialog: false,
    //   ),
    // );
    Navigator.of(ctx).pushNamed(CategoryMealPage.routeName,
        arguments: {'id': category.id, 'title': category.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
