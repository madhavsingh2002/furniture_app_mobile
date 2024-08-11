import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_cart/components/bottomNavbar.dart';
import 'package:product_cart/pages/homepage.dart';
import 'package:product_cart/pages/productlist.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEBE3DA),
        padding: const EdgeInsets.all(10.0),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'La Casa \n',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: 'Mama',
                    style: GoogleFonts.abrilFatface(
                      fontSize: 32,
                      color: const Color(0xFFFFB03C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'mia\n',
                    style: GoogleFonts.abrilFatface(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                      text: 'by Madhav singh',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 72, 70, 70),
                        fontStyle: FontStyle.italic,
                      )),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/onboard.png'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const BottomNavBar(
                    pages: [
                      HomeScreen(),
                      ProductListScreen(),
                      Center(child: Icon(Icons.notifications, size: 100, color: Colors.black)),
                      Center(child: Icon(Icons.person, size: 100, color: Colors.black)),
                    ],
                  )),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFF484330),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
