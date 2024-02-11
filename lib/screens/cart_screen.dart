import 'package:flutter/material.dart';
import 'package:flutter_bites/providers/food_item_provider.dart';
import 'package:flutter_bites/screens/liked_screen.dart';
import 'package:flutter_bites/screens/menu_screen.dart';
import 'package:flutter_bites/widgets/button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Cart",
          style: GoogleFonts.montserratAlternates(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const FavouriteScreen()));
              },
              icon: const Icon(Icons.favorite),
              color: Colors.white,
              iconSize: 32,
            ),
          ),
        ],
      ),
      body: Consumer<FoodItemProvider>(
        builder: (context, value, child) => value.total > 0
            ? Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.cart.length,
                          itemBuilder: (context, index) {
                            var food = value.cart[index];
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: 6, right: 7, top: 12),
                              child: Slidable(
                                endActionPane: ActionPane(
                                  extentRatio: 0.25,
                                  motion: const StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        value.removecart(food);
                                      },
                                      icon: Icons.delete,
                                      backgroundColor: Colors.red,
                                      borderRadius: BorderRadius.circular(6),
                                    )
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF3A4D6B),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/images/menu/burger${food.img}-removebg-preview.png",
                                            height: 60,
                                            width: 70,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                food.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(fontSize: 22),
                                              ),
                                              Text(
                                                "₹ ${food.cartct * food.cost}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        fontSize: 18,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 17, 160, 22)),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              value.deccount(food, true);
                                            },
                                            icon: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.remove,
                                                  size: 26,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 34,
                                              child: Center(
                                                child: Text(
                                                  food.cartct.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 28,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )),
                                          IconButton(
                                            onPressed: () {
                                              // Add your onPressed logic here
                                              value.inccount(food, true);
                                            },
                                            icon: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 26,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            );
                          })),
                  const Spacer(),
                  Center(
                      child: Text(
                    "₹ ${value.total}",
                    style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                  const SizedBox(
                    height: 6,
                  ),
                  const Center(
                      child: Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white60,
                        fontWeight: FontWeight.w600),
                  )),
                  MyButton(
                      name: "Go to Checkout",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  backgroundColor: const Color(0xFF3A4D6B),
                                  content: Container(
                                    width: 380,
                                    height: 340,
                                    child: Column(
                                      children: [
                                        Lottie.asset(
                                            "assets/animations/order.json",
                                            height: 190),
                                        const Text(
                                          "Order Placed",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Expanded(
                                            child: MyButton(
                                                name: "Continue",
                                                onTap: () {
                                                  value.reset();
                                                  Navigator.pop(context);
                                                }))
                                      ],
                                    ),
                                  ));
                            });
                      })
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "No items in cart yet",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
                  Center(
                      child: Text(
                    "Start Adding",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
                  MyButton(
                      name: "Go to Menu",
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const MenuScreen()),
                            (route) => false);
                      })
                ],
              ),
      ),
    );
  }
}
