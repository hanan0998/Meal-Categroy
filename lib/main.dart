import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/favorite_screen.dart';
import './screens/Categories_screen.dart';
import './screens/category_details_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // primaryColor: Colors.amber,
          colorScheme: ColorScheme.light(),
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          // giving themedata to texttheme to have the theme of the patent themedata
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: TextStyle(
                // fontSize: 24.0,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: TextStyle(
                fontSize: 21.0,
                fontFamily: "Robotocondensed",
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        // default is '/'
        '/': (context) => TabsScreen(),
        CategoryDetailsScreen.routeName: (context) => CategoryDetailsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      // onGeneratroute is used when a navigation is occure which is not registered in routes
      onGenerateRoute: (settings) {
        // return MaterialPageRoute means it return CategoriesScreen on this case
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
