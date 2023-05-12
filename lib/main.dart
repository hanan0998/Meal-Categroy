import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';

import './screens/filters_screen..dart';
import './screens/tabs_screen.dart';
import './screens/favorite_screen.dart';
import './screens/Categories_screen.dart';
import './screens/category_details_screen.dart';
import './screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vagan': false,
    'vegetarian': false
  };
// to reflect the filter on the category details screen
  List<Meal> _avaliableMeals = DUMMY_MealS;

  // adding an empty list of meals for favorite meals
  List<Meal> _favoritedMeals = [];

  // making function to pass it to filter_screen
  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _avaliableMeals = DUMMY_MealS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vagan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // adding logic for the favorite meals
  void _toggleFavoriteMeal(String mealId) {
    final existingIndex = _favoritedMeals.indexWhere((meal) {
      return meal.id == mealId;
    });

    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(DUMMY_MealS.firstWhere((element) {
          return element.id == mealId;
        }));
      });
    }
  }

  // to check whether meal is present in _favoritedMeals
  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((element) => element.id == id);
  }

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
          primaryColor: Colors.purple.shade900,
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
        '/': (context) => TabsScreen(_favoritedMeals),
        CategoryDetailsScreen.routeName: (context) =>
            CategoryDetailsScreen(_avaliableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavoriteMeal, _isMealFavorite),
        // giving function as an argument to FilterScreen
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
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
