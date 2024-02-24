import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersNotifer extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifer()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifer, Map<Filter, bool>>((ref) => FiltersNotifer());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree)
      return false;
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree)
      return false;
    if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian)
      return false;
    if (activeFilter[Filter.vegan]! && !meal.isVegan) return false;
    return true;
  }).toList();
});