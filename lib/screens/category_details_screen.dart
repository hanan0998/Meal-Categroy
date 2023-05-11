import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/mealItemWidget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const routeName = '/categroy-details';
  // final String categoryid;
  // final String categorytitle;
  // CategoryDetailsScreen(this.categoryid, this.categorytitle);

  @override
  Widget build(BuildContext context) {
    // taking argument which is comming from category item widget
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String categorytitle = routeArg['title'] as String;
    final String categoryid = routeArg['id'] as String;
    // getting the specified recipe comparing with specific category id
    final categoryMeal = DUMMY_MealS.where(
      (element) {
        return element.categories.contains(categoryid);
      },
    ).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categorytitle,
            style: TextStyle(fontFamily: 'Raleway'),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItemWidget(
                id: categoryMeal[index].id,
                title: categoryMeal[index].title,
                imageUrl: categoryMeal[index].imageUrl,
                duration: categoryMeal[index].duration,
                complexity: categoryMeal[index].complexity,
                affordability: categoryMeal[index].affordability);
          },
          itemCount: categoryMeal.length,
        ));
  }
}
