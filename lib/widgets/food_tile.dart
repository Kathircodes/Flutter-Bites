import 'package:flutter/material.dart';
import 'package:flutter_bites/models/food_details.dart';
import 'package:flutter_bites/providers/food_item_provider.dart';
import 'package:flutter_bites/screens/food_screen.dart';

class FoodTile extends StatelessWidget {
  const FoodTile(
      {super.key, required this.img, required this.model, required this.food});
  final String img;
  final FoodItemProvider model;
  final FoodDetails food;

  @override
  Widget build(BuildContext context) {
    String name = food.name;
    int cost = food.cost;
    double rating = food.rating;
    // bool incart = food.incart;
    bool isliked = food.isliked;

    return Card(
      color: Theme.of(context).cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 174, 0),
                ),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    model.toggleLike(food);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFF),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      isliked ? Icons.favorite : Icons.favorite_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                img,
                height: 125,
              ),
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        name,
                        softWrap: true,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      "₹ $cost",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 17,
                          color: const Color.fromARGB(255, 17, 160, 22)),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            FoodScreen(food: food, img: img)));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4, right: 4),
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.add,
                      size: 32,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 6.5)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
