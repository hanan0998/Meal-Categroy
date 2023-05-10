import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(title: Text(categorytitle)),
      body: Center(child: Text("The Recipes for the Category!")),
    );
  }
}
