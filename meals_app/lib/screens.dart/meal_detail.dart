// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';

import 'package:meals_app/main.dart';
import 'package:meals_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key? key,
    required this.meal,
    required this.onToggleFavorite,
  }) : super(key: key);
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    print('MealDetailScreen');
    final kTextLabelLarge = Theme.of(context).textTheme.labelLarge!.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
        fontSize: 24);
    final kTextBodyMedium = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.onBackground);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: () {
          onToggleFavorite(meal);
        }, icon: const Icon(Icons.star))],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(meal.imageUrl),
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: kTextLabelLarge,
            ),
            const SizedBox(
              height: 14,
            ),
            for (var ingredient in meal.ingredients)
              Text(
                ingredient,
                textAlign: TextAlign.center,
                style: kTextBodyMedium,
              ),
            Text(
              'Steps',
              style: kTextLabelLarge,
            ),
            const SizedBox(
              height: 14,
            ),
            for (var step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: kTextBodyMedium,
                ),
              ),
          ],
        ),
      )),
    );
  }
}
