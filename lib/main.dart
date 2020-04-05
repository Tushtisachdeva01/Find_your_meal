import 'package:flutter/material.dart';

import './dummydata.dart';
import './screens/filter_screen.dart';
import './screens/tab_screen2.dart';
import './screens/mealDetail_screen.dart';
import './screens/meals_screen.dart';
import './screens/categories_screen.dart';
import './models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;

  List<Meal> favouriteMeal = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final index = favouriteMeal.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      setState(() {
        favouriteMeal.removeAt(index);
      });
    } else {
      setState(() {
        favouriteMeal.add(
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
      );
      });
    }
  }

  bool isFav(String id){
    return favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 25,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: '/start',
      routes: {
        '/start': (ctx) => TabsScreen(favouriteMeal),
        '/meals': (ctx) => MealsScreen(availableMeal),
        '/mealDetail': (ctx) => MealDetailScreen(toggleFavourite ,isFav),
        '/filters': (ctx) => FilterScreen(filters, setFilters),
        // MealDetailScreen.routeName : (ctx) =>MealDetailScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
    );
  }
}
