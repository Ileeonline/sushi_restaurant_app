import 'package:flutter/material.dart';
import 'package:sushi_restaurant/components/food_class.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        imagePath: 'Assets/images/sushi1.png',
        foodName: 'Salmon Sushi',
        price: '\$23.3',
        rating: '4.3'),
    Food(
        imagePath: 'Assets/images/sushi2.png',
        foodName: 'Tuna',
        price: '\$21.3',
        rating: '4.9'),
  ];
  List<Food> _cart = [];

//getter method
  List<Food> get fooditems => _foodMenu;
  List<Food> get cart => _cart;

//add to cart
  void addToCart(Food fooditem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(fooditem);
      notifyListeners();
    }
  }

//remove from cart
  void removeItems(Food food, BuildContext context) {
    _cart.remove(food);
    notifyListeners();
  }
}
