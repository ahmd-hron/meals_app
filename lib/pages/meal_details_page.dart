import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/meal-details-page';

  Widget _buildSectionTitile(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        height: 150,
        width: 300,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String routeArgu =
        ModalRoute.of(context).settings.arguments as String;

    final String mealId = routeArgu;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
print('dsadsa');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeal.title}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _buildSectionTitile(context, 'ingradinats'),
          _buildSectionsContainers(context, selectedMeal.ingredients),
          _buildSectionTitile(context, 'steps'),
          _buildContainer(
            ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text('${selectedMeal.steps[index]}'),
                ),
                Divider()
              ]),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            Navigator.of(context).pop(selectedMeal.id);
          }),
    );
  }

  Widget _buildSectionsContainers(
      BuildContext context, List<String> listOfInstructure) {
    return Container(
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListView(
        children: [
          ...listOfInstructure.map(
            (mealIngradint) => Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(mealIngradint)),
            ),
          )
        ],
      ),
    );
  }
}
