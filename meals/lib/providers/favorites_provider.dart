import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier()
      : super([]); // GT dc quan ly boi StateNotifier se ko duoc chinh sua GT

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite =
        state.contains(meal); //bien state chinh la <List<Meal> dc cung cap boi StateNotifier
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else
      state = [...state, meal]; // luon tao moi trong StateNotifier
    return true;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
