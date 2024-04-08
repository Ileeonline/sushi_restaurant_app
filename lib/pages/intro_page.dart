import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant/components/my_button.dart';
import 'package:sushi_restaurant/pages/menu_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'SUSHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
              child: Image.asset(
                'Assets/images/ist.png',
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'THE TASTE OF JAPANESE FOOD ',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Feel the taste of most popular japanese food from anywhere and anytime',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 18,
                  height: 2,
                ),
              ),
            ),
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MenuPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
