// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/model/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('MealDetailScreen');
    final kTextLabelLarge = Theme.of(context).textTheme.labelLarge!.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
        fontSize: 24);
    final kTextBodyMedium = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.onBackground);
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);


    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        wasAdded ? 'Meal added a favorite' : 'Meal removed.'),
                  ),
                );
              },
              icon:  Icon(isFavorite? Icons.star:Icons.star_border))
        ],
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
