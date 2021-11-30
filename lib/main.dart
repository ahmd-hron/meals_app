import 'package:flutter/material.dart';

import './models/meal.dart';
import './data/dummy_data.dart';
import './pages/tabs_page.dart';
import './pages/category_meals_page.dart';
import './pages/catigories_page.dart';
import './pages/meal_details_page.dart';
import './pages/filters_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String gluteenFree = 'gluteenFree';
  String vegan = 'Vegan';
  String lactosFree = 'lactos free';
  String vegetrian = 'vegitriann';

  Map<String, bool> filters = {
    'gluteenFree': false,
    'Vegan': false,
    'lactos free': false,
    'vegitriann': false
  };

  List<Meal> prefferdMeal = DUMMY_MEALS;
  void _saveFiltersData(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
    });
    prefferdMeal = DUMMY_MEALS.where((meal) {
      if (filters[gluteenFree] && !meal.isGlutenFree) {
        return false;
      } else if (filters[vegan] && !meal.isVegan) {
        return false;
      } else if (filters[vegetrian] && !meal.isVegetarian) {
        return false;
      } else if (filters[lactosFree] && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'food app',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
            headline5: TextStyle(
                fontSize: 22,
                fontFamily: 'Raleway',
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      // home: CategoriesPage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(_saveFiltersData, filters),
        CategoryMealPage.routeName: (ctx) => CategoryMealPage(prefferdMeal),
        MealDetailsPage.routeName: (ctx) => MealDetailsPage()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: CategoriesPage(),
//     );
//   }
// }
