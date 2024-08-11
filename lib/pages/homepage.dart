import 'package:flutter/material.dart';
import 'package:product_cart/components/ProductCard.dart';
import 'package:product_cart/components/bottomNavbar.dart';
import 'package:product_cart/data/dummydata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      appBar: AppBar(
        title: const Text('La Casa'),
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF2E9),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Get 30% Promo',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF484330),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Redeem',
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
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage('assets/image2.png'),
                        height: 150,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text('Newest', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 325, // Set a fixed height for the ListView
              child: ListView.builder(
                itemCount: furnitureMenu.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ProductCard(product: furnitureMenu[index]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text('Discover', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 325, // Set a fixed height for the ListView
              child: ListView.builder(
                itemCount: furnitureMenu.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ProductCard(product: furnitureMenu[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
