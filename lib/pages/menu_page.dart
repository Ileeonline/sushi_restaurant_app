import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sushi_restaurant/components/my_button.dart';
import 'package:sushi_restaurant/components/shop_class.dart';
import 'package:sushi_restaurant/pages/cart_page.dart';
import 'package:sushi_restaurant/themes/colors.dart';

import '../components/food_tile.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

void NavigateToFoodDetailsPage(int index, BuildContext context) {
  final shop = context.read<Shop>();
  final fooditems = shop.fooditems;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FoodDetailsPage(
        food: fooditems[index],
      ),
    ),
  );
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodItems = shop.fooditems;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          foregroundColor: Colors.grey[800],
          leading:const Icon(
            Icons.menu,
            size: 30,
          ),
          title:const Text(
            'Swabi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              ),
              icon:const Icon(
                Icons.shopping_cart,
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Get 32% Promo',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyButton(
                        text: "Redeem",
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    'Assets/images/sushi2.png',
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: PrimaryColor,
                        width: 2,
                      ),
                    ),
                    hintText: 'Search...'),
                cursorColor: PrimaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Food Menu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    return FoodTile(
                      food: foodItems[index],
                      onTap: () => NavigateToFoodDetailsPage(index, context),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'Assets/images/ist.png',
                        height: 80,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '\$23.9',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
