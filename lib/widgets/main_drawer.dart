import 'package:flutter/material.dart';
import 'package:foodmeal/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      IconData icon, String text, final Function()? tabHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tabHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: const Text(
              'ashraf sayed',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Color.fromRGBO(255, 233, 221, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(Icons.restaurant, 'Meal', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
