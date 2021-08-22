import 'package:flutter/material.dart';
import 'package:foodmeal/categories_screen.dart';
import 'package:foodmeal/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeNmae,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title.toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.7), color.withOpacity(1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
