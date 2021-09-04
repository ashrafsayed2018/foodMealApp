import 'package:flutter/material.dart';
import 'package:foodmeal/dummy_data.dart';
import 'package:foodmeal/screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMails = dummyMeals;
  List<Meal> _favoritedMails = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMails = dummyMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree!) {
          return false;
        }

        if (_filters['lactos']! && !meal.isLactoseFree!) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan!) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian!) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  // toggle favorite food

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMails.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMails.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMails.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  // check is meal favorite

  bool _isMealFavorite(String mealId) {
    return _favoritedMails.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoritedMails),
        CategoryMealsScreen.routeNmae: (context) =>
            CategoryMealsScreen(_availableMails),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_isMealFavorite, _toggleFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters)
      },
    );
  }
}
