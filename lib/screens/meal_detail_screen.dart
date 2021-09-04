import 'package:flutter/material.dart';
import 'package:foodmeal/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorites;
  final Function isFavorite;

  MealDetailScreen(this.isFavorite, this.toggleFavorites);
  static const routeName = "/meal-detail";
  Widget buildSectionTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 300,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients![index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients?.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (cxt, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1} '),
                    ),
                    title: Text(selectedMeal.steps![index]),
                  ),
                  const Divider()
                ],
              ),
              itemCount: selectedMeal.steps?.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealId)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: () => toggleFavorites(mealId),
      ),
    );
  }
}
