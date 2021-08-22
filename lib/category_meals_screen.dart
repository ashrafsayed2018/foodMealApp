import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeNmae = '/category-meals';
  // final String cateogryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(this.cateogryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: const Center(
        child: Text('The Reciepe for the Category'),
      ),
    );
  }
}
