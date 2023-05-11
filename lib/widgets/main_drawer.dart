import 'package:flutter/material.dart';

import '../screens/filters_screen..dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  Widget buildListTile(String title, IconData icon, VoidCallback onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "Robotocondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          height: 150,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Text('Cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white)),
        ),
        buildListTile('Meals', Icons.restaurant, () {
          // Navigator.of(context).pushNamed('/');
          // the above statement is not very satisfying we have to delete the recent page
          // from the stack of pages, so that we use that below statement
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
        }),
      ]),
    );
  }
}
