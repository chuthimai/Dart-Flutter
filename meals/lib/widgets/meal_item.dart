import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function() selectMeal;

  const MealItem({super.key, required this.meal, required this.selectMeal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      // hieu ung bong do
      child: InkWell(
        onTap: selectMeal,
        child: Stack(
          children: [
            Hero(
              tag: meal.id, // phan biet giua cac anh
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.fill,
                width: double.infinity, // anh phu het chieu ngang
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0, // keo dai tu duong vien ben trai den ben phai
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      // neu van ban qua dai se bien thanh dau ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String capword(String word) {
  return word[0].toUpperCase() + word.substring(1).toLowerCase();
}