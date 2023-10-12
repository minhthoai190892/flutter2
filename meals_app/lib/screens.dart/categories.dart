// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens.dart/meals.dart';
import 'package:meals_app/screens.dart/tabs.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
    required this.onToggleFavorite,
  }) : super(key: key);
  final void Function(Meal meal) onToggleFavorite;
  
  void _selectCategory(BuildContext context, Category category) {
    //lọc danh sách
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MealsScreen(title: category.title, meals: filteredMeals,onToggleFavorite: onToggleFavorite),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print('CategoriesScreen');
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // số cột
        childAspectRatio: 3 / 2, //tỷ lệ khung hình từ trên xuống
        crossAxisSpacing: 20, //khoảng cách
        mainAxisSpacing: 20, //khoảng cách
      ),
      // children:availableCategories.map((category) => CategoryGridItem(category: category)).toList()
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
