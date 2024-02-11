// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bites/providers/food_item_provider.dart';
import 'package:flutter_bites/screens/cart_screen.dart';
import 'package:flutter_bites/widgets/food_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Favourite Burgers",
          style: GoogleFonts.montserratAlternates(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_bag),
            color: Colors.white,
            iconSize: 32,
          ),
        ],
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          height: MediaQuery.of(context).size.height,
          child: Consumer<FoodItemProvider>(
            builder:
                (BuildContext context, FoodItemProvider value, Widget? child) =>
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 8),
                        itemCount: value.liked.length,
                        itemBuilder: (context, index) {
                          var food = value.liked[index];
                          return FoodTile(
                            img:
                                "assets/images/menu/burger${food.img}-removebg-preview.png",
                            model: value,
                            food: food,
                          );
                        }),
          ),
        ),
      ),
    );
  }
}
