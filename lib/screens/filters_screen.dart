import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final void Function(Map<String, bool>) saveFilters;

  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactos']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, final Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters page'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactos': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(
                Icons.save,
              ))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gulteen-free', 'include only gluteen free', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                  print(_glutenFree);
                });
              }),
              _buildSwitchListTile(
                  'lactos-free', 'include only lactos free', _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'vegetrian', 'include only vegetrian free', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('vegan', 'include only vegan free', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
