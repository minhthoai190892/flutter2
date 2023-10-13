import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  vegan,
  vegetarian,
  lactoseFree,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
          Filter.lactoseFree: false,
        });
  void setFilter(Filter filter, bool isActive) {
    //đặt trạng thái thằng Map mới
    state = {...state, filter: isActive};
    print("filter: " + filter.toString());
  }

  // void setFilters(Map<Filter, bool> chosenFilters) {
  //   state = chosenFilters;
  // }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  //nhìn vào mealsProvider
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
 return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
