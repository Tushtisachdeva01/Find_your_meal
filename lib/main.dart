import 'package:flutter/material.dart';
import './screens/mealDetail_screen.dart';
import './screens/meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: CategoryScreen(),
      routes: {
        '/meals': (ctx) => MealsScreen(),
        '/mealDetail': (ctx) => MealDetailScreen()
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
