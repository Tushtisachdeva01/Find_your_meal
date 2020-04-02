import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();

  final Function saveFilters;
  final Map<String,bool> currentFilter;

  FilterScreen(this.currentFilter,this.saveFilters);
}

class _FilterScreenState extends State<FilterScreen> {

  bool glutenFree = false;
  bool vegan = false;
  bool vegetarian = false;
  bool lactoseFree = false;

@override
  initState(){
    glutenFree = widget.currentFilter['gluten'];
    lactoseFree = widget.currentFilter['lactose'];
    vegan = widget.currentFilter['vegan'];
    vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  Widget switchValue(String title, bool value, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meals here',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  switchValue(
                    'Gluten Free',
                    glutenFree,
                    (newValue) {
                      setState(
                        () {
                          glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  switchValue(
                    'Lactose Free',
                    lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  switchValue(
                    'Vegan',
                    vegan,
                    (newValue) {
                      setState(
                        () {
                          vegan = newValue;
                        },
                      );
                    },
                  ),
                  switchValue(
                    'Vegetarian',
                    vegetarian,
                    (newValue) {
                      setState(
                        () {
                          vegetarian = newValue;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
