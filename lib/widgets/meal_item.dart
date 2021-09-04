import 'package:flutter/material.dart';
import 'package:foodmeal/models/meal.dart';
import 'package:foodmeal/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  // void selectMeal() {};

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
        break;
      case Complexity.chanllenging:
        return 'Challenging';
        break;
      case Complexity.hard:
        return "hard";
        break;
      default:
        return "unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
        break;
      case Affordability.pricy:
        return 'Pricy';
        break;
      case Affordability.luxurious:
        return "Luxurious";
        break;
      default:
        return "unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context)
            .pushNamed(MealDetailScreen.routeName, arguments: id)
            // the result we get when the user come back from meal detail screen
            .then((result) {
          if (result != null) {}
        })
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(3),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl.toString(),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 380,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title.toString(),
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${duration.toString()} min ')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
