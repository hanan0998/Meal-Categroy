import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(@required this.currentFilters, @required this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;

  var _vegetarian = false;

  var _vegan = false;

  var _lactoseFree = false;
// it save the switch current state
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vagan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vagan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save)),
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten-free',
                      'Only include Gluten-free meals', _glutenFree, (value1) {
                    setState(() {
                      _glutenFree = value1;
                      print(_glutenFree);
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose-free',
                      'Only include Lactose-free meals',
                      _lactoseFree, (value2) {
                    setState(() {
                      _lactoseFree = value2;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian',
                      'Only include Vegetarian meals', _vegetarian, (value3) {
                    setState(() {
                      _vegetarian = value3;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only include Vegan meals', _vegan, (value4) {
                    setState(() {
                      _vegan = value4;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
