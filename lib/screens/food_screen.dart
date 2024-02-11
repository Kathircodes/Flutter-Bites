import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bites/models/food_details.dart';
import 'package:flutter_bites/providers/food_item_provider.dart';
import 'package:flutter_bites/screens/cart_screen.dart';
import 'package:flutter_bites/screens/menu_screen.dart';
import 'package:flutter_bites/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key, required this.food, required this.img});
  final FoodDetails food;
  final String img;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didpop) async {
        if (didpop) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MenuScreen()),
              (route) => false,
            );
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Food Details",
            style: GoogleFonts.montserratAlternates(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.shopping_bag),
              color: Colors.white,
              iconSize: 32,
            ),
          ],
        ),
        body: Consumer<FoodItemProvider>(
          builder: (context, value, child) => Column(children: [
            Image.asset(
              img,
              height: 310,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 174, 0),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            food.rating.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 19),
                          const Icon(
                            Icons.watch_later,
                            color: Color.fromARGB(255, 255, 174, 0),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            food.deliveryTime,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 19),
                          const Icon(
                            Icons.shopping_bag,
                            color: Color.fromARGB(255, 255, 174, 0),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            food.orders,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                // Adjust the space from right
                Column(
                  children: [
                    Text(
                      "₹ ${food.cost}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 17, 160, 22),
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.toggleLike(food);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 12, left: 36),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFF),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          food.isliked
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          // Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 28,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                food.descripton,
                style:
                    GoogleFonts.openSans(fontSize: 18, color: Colors.white54),
              ),
            ),
            const Spacer(),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      value.deccount(food, false);
                    },
                    icon: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          size: 34,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 42,
                      child: Center(
                        child: Text(
                          food.cartct.toString(),
                          style: const TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  IconButton(
                    onPressed: () {
                      // Add your onPressed logic here
                      value.inccount(food, false);
                    },
                    icon: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 34,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: value.cart.any((item) => item.name == food.name)
                          ? MyButton(
                              name: "Update Cart",
                              onTap: () {
                                value.addcart(food);
                              })
                          : MyButton(
                              name: "Add to Cart",
                              onTap: () {
                                value.addcart(food);
                              }))
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            )
          ]),
        ),
      ),
    );
  }
}

// bool flag = value.cart.any((item) => item.name == food.name);
