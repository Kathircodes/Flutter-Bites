class FoodDetails {
  String name;
  int cost;
  double rating;
  String descripton;
  int img;
  bool incart = false;
  bool isliked = false;
  String deliveryTime;
  String orders;
  int cartct = 0;

  FoodDetails(this.name, this.cost, this.rating, this.descripton, this.img,
      this.deliveryTime, this.orders, this.cartct);
}
