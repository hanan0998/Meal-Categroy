import 'package:flutter/material.dart';
import './Categories_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // to tell which tab will be open as default tab
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meal"),
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                  color: Colors.white,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoriteScreen()]),
      ),
    );
  }
}
