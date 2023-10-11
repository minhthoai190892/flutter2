// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Image(
            image: NetworkImage(meal.imageUrl),
            height: 300,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          for (var ingredient in meal.ingredients)
            Text(
              ingredient,
            ),
          for (var step in meal.steps)
            Text(
              step,
            ),
        ],
      )),
    );
  }
}
