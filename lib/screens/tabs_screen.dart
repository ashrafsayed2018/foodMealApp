import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorities_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabsScreen';
  List<Meal> favoriteMails;
  TabsScreen(this.favoriteMails);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Widget>> _pages;

  @override
  initState() {
    super.initState();

    _pages = [
      {'page': const CategoriesScreen(), 'title': const Text('Category')},
      {
        'page': FavoritiesScreen(widget.favoriteMails),
        'title': const Text("Your Favorites")
      }
    ];
  }

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
