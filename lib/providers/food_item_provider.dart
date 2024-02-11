import 'package:flutter/material.dart';
import 'package:flutter_bites/models/food_data.dart';
import 'package:flutter_bites/models/food_details.dart';

class FoodItemProvider extends ChangeNotifier {
  final List<FoodDetails> foods = foodList;
  List<FoodDetails> liked = [];
  List<FoodDetails> cart = [];

  toggleLike(FoodDetails item) {
    item.isliked = !item.isliked;
    if (item.isliked) {
      liked.add(item);
    } else {
      liked.remove(item);
    }
    // liked.forEach(
    //   (e) => print(e.name),
    // );
    notifyListeners();
  }

  inccount(FoodDetails item, bool fromCart) {
    item.cartct++;
    if (fromCart) {
      print(foods[item.img - 1].cartct);
      foods[item.img - 1].cartct = item.cartct;
      carttotal();
    }
    notifyListeners();
  }

  deccount(FoodDetails item, bool fromCart) {
    if (item.cartct > 1) item.cartct--;
    if (fromCart) {
      foods[item.img - 1].cartct = item.cartct;
      carttotal();
    }

    notifyListeners();
  }

  addcart(FoodDetails item) {
    bool found = false;
    if (item.cartct > 0) {
      for (int i = 0; i < cart.length; i++) {
        if (cart[i].img == item.img) {
          cart[i].cartct = item.cartct;
          found = true;
        }
      }
      if (found == false) {
        cart.add(FoodDetails(item.name, item.cost, item.rating, item.descripton,
            item.img, item.deliveryTime, item.orders, item.cartct));
      }
      print(cart[0].cartct);
      print(cart.length);
      carttotal();
      notifyListeners();
    }
  }

  int total = 0;
  carttotal() {
    total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].cartct * cart[i].cost;
    }
    notifyListeners();
  }

  removecart(FoodDetails item) {
    cart.remove(item);
    foods[item.img - 1].cartct = 0;
    carttotal();
    notifyListeners();
  }

  reset() {
    cart = [];
    for (int i = 0; i < 6; i++) {
      foods[i].cartct = 0;
    }
    carttotal();
    notifyListeners();
  }
}
