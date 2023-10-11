// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/category.dart';

import 'package:meals_app/screens.dart/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCategory(BuildContext context, Category category) {
    //lọc danh sách
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MealsScreen(title: category.title, meals: filteredMeals),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print('CategoriesScreen');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: SafeArea(
        child: GridView(
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
        ),
      ),
    );
  }
}
