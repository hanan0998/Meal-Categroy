import 'package:flutter/material.dart';
import '../screens/category_details_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItemWidget(this.title, this.color, this.id);
// passing data to another screen through pushnamed
  void CategoryRecipesLoader(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryDetailsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CategoryRecipesLoader(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
