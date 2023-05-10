import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Categories",
        style: TextStyle(fontFamily: 'Raleway'),
      )),
      body: GridView(
          padding: const EdgeInsets.all(15),
          children: [
            ...DUMMY_CATEGORIES
                .map((catItem) => CategoryItemWidget(
                    catItem.title, catItem.color, catItem.id))
                .toList(),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // how many pixel on item have
              maxCrossAxisExtent: 200,
              // ratio between height and width
              childAspectRatio: 1.5, // 3/2 = 1.5
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
