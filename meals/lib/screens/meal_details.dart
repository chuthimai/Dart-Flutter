import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    // tham so WidgetRef ref dc truyen tu dong boi riverpod de lang nghe Provider
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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(wasAdded ? 'Meal added as favorite.':'Meal removed.'),
              ));
            },
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 300,
                  color: Colors.black54,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      color: Colors.black54,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min',
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          MealItemTrait(
                            icon: Icons.work,
                            label: capword(meal.complexity.name),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          MealItemTrait(
                            icon: Icons.attach_money,
                            label: capword(meal.affordability.name),
                          )
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ...meal.ingredients.map(
              (e) => Text(
                e,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ...meal.steps.map(
              (e) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  e,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
