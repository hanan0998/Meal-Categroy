import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../widgets/mealItemWidget.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static const routeName = '/categroy-details';

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  // final String categoryid;
  late String categroyTitle;

  late List<Meal> displayMeals;
  var initDataLoad = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!initDataLoad) {
      // taking argument which is comming from category item widget
      final routeArg =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categroyTitle = routeArg['title'] as String;
      final categoryid = routeArg['id'] as String;
      // getting the specified recipe comparing with specific category id
      displayMeals = DUMMY_MealS.where(
        (element) {
          return element.categories.contains(categoryid);
        },
      ).toList();
      initDataLoad = true;
    }

    super.didChangeDependencies();
  }

  void _deleteMeal(String mealId) {
    displayMeals.removeWhere((element) => element.id == mealId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categroyTitle,
            style: TextStyle(fontFamily: 'Raleway'),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItemWidget(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              complexity: displayMeals[index].complexity,
              affordability: displayMeals[index].affordability,
              removeId: _deleteMeal,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
