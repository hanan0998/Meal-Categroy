import 'package:flutter/material.dart';
import '../widgets/mealItemWidget.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorteMeals;
  FavoriteScreen(@required this.favorteMeals);

  @override
  Widget build(BuildContext context) {
    if (favorteMeals.isEmpty) {
      return Center(
          child: Text("You have no favorites yet - start adding some!"));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItemWidget(
            id: favorteMeals[index].id,
            title: favorteMeals[index].title,
            imageUrl: favorteMeals[index].imageUrl,
            duration: favorteMeals[index].duration,
            complexity: favorteMeals[index].complexity,
            affordability: favorteMeals[index].affordability,
            // removeId: _deleteMeal,
          );
        },
        itemCount: favorteMeals.length,
      );
    }
  }
}
