import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritiesScreen extends StatelessWidget {
  final List<Meal> favoriteMails;
  FavoritiesScreen(this.favoriteMails);

  @override
  Widget build(BuildContext context) {
    if (favoriteMails.isEmpty) {
      return const Center(
        child: Text('you have no favoriteis yet start add some !'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMails[index].id,
            title: favoriteMails[index].title,
            imageUrl: favoriteMails[index].imageUrl,
            duration: favoriteMails[index].duration,
            complexity: favoriteMails[index].complexity,
            affordability: favoriteMails[index].affordability,
          );
        },
        itemCount: favoriteMails.length,
      );
    }
  }
}
