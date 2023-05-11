import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-page';

  Widget buildSectiontitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Widget buildContainer(Widget child) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(10),
          width: mediaQuery.size.width * 0.9,
          height: mediaQuery.size.height * 0.29,
          // color: Colors.amber,
          child: child);
    }

    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    // to check the id match with meal id
    final mealSelected = DUMMY_MealS.firstWhere(
      (element) => element.id == mealId,
    );
    return Scaffold(
        appBar: AppBar(
            title: Text(
          '${mealSelected.title}',
          style: TextStyle(fontFamily: 'Raleway'),
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: mediaQuery.size.width * 1,
                // height: (MediaQuery.of(context).size.height - appBar),
                child: Image.network(
                  mealSelected.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectiontitle(context, "Ingredients"),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(mealSelected.ingredients[index]),
                    ),
                  ),
                  itemCount: mealSelected.ingredients.length,
                ),
              ),
              buildSectiontitle(context, "Steps"),
              buildContainer(ListView.builder(
                itemBuilder: (context, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(child: Text("# ${index + 1}")),
                    title: Text(
                      mealSelected.steps[index],
                      style: TextStyle(
                          fontFamily: "Robotocondensed",
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Divider(thickness: 1.2),
                ]),
                itemCount: mealSelected.steps.length,
              )),
            ],
          ),
        ));
  }
}
