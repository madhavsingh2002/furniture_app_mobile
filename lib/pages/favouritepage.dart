import 'package:flutter/material.dart';
import 'package:product_cart/pages/cartpage.dart';
import 'package:product_cart/pages/productdetails.dart';
import 'package:product_cart/provider/cartprovider.dart';
import 'package:product_cart/provider/favouriteprovider.dart';
import 'package:provider/provider.dart';

class Favouritepage extends StatelessWidget {
  const Favouritepage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      appBar: AppBar(
        title: Text('Favourite'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favouriteProvider, child) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: favorite.favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    final productName =
                        favorite.favorites.keys.elementAt(index);
                    final product = favorite.favorites[productName] ?? {};
                    return Container(
                      margin: const EdgeInsets.only(bottom: 25.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF2E9),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(
                                image: AssetImage(product?['image']),
                                height: 100,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product?['name'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${product?['category']}',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 93, 91, 91),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$${product?['price']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .addItem(product);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '${product['name']} added to cart!',
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                          backgroundColor: Color.fromARGB(
                                              255, 197, 174, 148),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF484330),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Add to Cart',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 226, 197,
                                      164), // Background color of the circle
                                  shape: BoxShape
                                      .circle, // Makes the container circular
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    favorite.removeFavorite(productName);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
