// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/food_class.dart';
import 'package:sushi_restaurant/components/my_button.dart';
import 'package:sushi_restaurant/components/shop_class.dart';
import 'package:sushi_restaurant/themes/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

void deleteFromCart(Food food, BuildContext context) {
  final shop = context.read<Shop>();
  shop.removeItems(food, context);
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: PrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: PrimaryColor,
          title:const Text('My Cart'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodname = food.foodName;
                  final String foodprice = food.price;
                  return Container(
                    decoration: BoxDecoration(
                      color: SecondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin:const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    child: ListTile(
                      title: Text(
                        foodname,
                        style:const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodprice,
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => deleteFromCart(food, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: 'Pay Now',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
