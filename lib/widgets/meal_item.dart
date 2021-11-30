import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../pages/meal_details_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final Function removeMeal;

  const MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    @required this.id,
    @required this.removeMeal,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challenging:
        return 'challanging';
        break;
      case Complexity.Hard:
        return 'hard';
        break;
      default:
        return '';
        break;
    }
  }

  String get afforabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
        break;
      case Affordability.Pricey:
        return 'priecy';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return ' ';
    }
  }

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsPage.routeName, arguments: id)
        .then((value) {
      if (value == null) return;
      removeMeal(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: Colors.black26,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  bottom: 20,
                  right: 10,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '$duration min',
                        ),
                      ],
                    ),
                    Row(children: [
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(complexityText),
                    ]),
                    Row(children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(afforabilityText),
                    ]),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
