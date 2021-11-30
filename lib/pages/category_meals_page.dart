import 'package:flutter/material.dart';

import '../Widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealPage extends StatefulWidget {
  static const routeName = '/category-meal';
  final List<Meal> avilableMeals;
  CategoryMealPage(this.avilableMeals);

  @override
  _CategoryMealPageState createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  String categoryTitle;
  String categoryId;
  List<Meal> cMeals;
  @override
  void didChangeDependencies() {
    final routeArgu =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgu['title'];
    categoryId = routeArgu['id'];
    cMeals = widget.avilableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      cMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          id: cMeals[index].id,
          title: cMeals[index].title,
          imageUrl: cMeals[index].imageUrl,
          duration: cMeals[index].duration,
          affordability: cMeals[index].affordability,
          complexity: cMeals[index].complexity,
          removeMeal: _removeMeal,
        ),
        itemCount: cMeals.length,
      ),
    );
  }
}
