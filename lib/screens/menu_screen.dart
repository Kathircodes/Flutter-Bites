import 'package:flutter/material.dart';
import 'package:flutter_bites/providers/food_item_provider.dart';
import 'package:flutter_bites/screens/cart_screen.dart';
import 'package:flutter_bites/screens/liked_screen.dart';
import 'package:flutter_bites/widgets/food_tile.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

List imagelist = ["burger1.png", "burger1.png", "burger1.png"];

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          toolbarHeight: 72,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello! Kathir",
                style: GoogleFonts.montserratAlternates(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "What burger are you craving?",
                style: GoogleFonts.montserratAlternates(
                    color: const Color.fromARGB(154, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 12,
              ), //16b
              // height: 48,
              // decoration: BoxDecoration(
              //     color: Colors.pink, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 24,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FavouriteScreen()));
                  },
                  icon: const Icon(Icons.favorite),
                  color: Colors.white,
                  iconSize: 32,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 24,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartScreen()));
                },
                icon: const Icon(Icons.shopping_bag),
                color: Colors.white,
                iconSize: 32,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Burgers",
                    hintStyle: const TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.black,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        print("Hello");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Icon(
                          Icons.filter_list,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // TODO: Carousel
              FlutterCarousel(
                options: CarouselOptions(
                    height: 160,
                    floatingIndicator: false,
                    showIndicator: true,
                    slideIndicator: CircularWaveSlideIndicator()),
                items: imagelist.map((i) {
                  return Builder(
                    builder: ((context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          // ignore: prefer_interpolation_to_compose_strings
                          'assets/images/' + i,
                        ),
                      );
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              //TODO: Menu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Popular Burgers",
                      style: GoogleFonts.montserratAlternates(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Consumer<FoodItemProvider>(
                    builder: (context, model, child) => Container(
                      margin: const EdgeInsets.all(6),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.93,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          var food = model.foods[index];
                          return FoodTile(
                            img:
                                "assets/images/menu/burger${food.img}-removebg-preview.png",
                            model: model,
                            food: food,
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

// 303b5b