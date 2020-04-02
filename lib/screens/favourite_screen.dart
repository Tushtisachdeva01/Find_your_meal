import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favourites;

  FavouriteScreen(this.favourites);

  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return Center(
        child: Text('There are no favourites yet'),
      );
    } else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favourites[index].id,
            title: favourites[index].title,
            imageUrl: favourites[index].imageUrl,
            duration: favourites[index].duration,
            complexity: favourites[index].complexity,
            affordability: favourites[index].affordability,
          );
        },
        itemCount: favourites.length,
      );
    }
  }
}
