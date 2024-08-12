import 'package:flutter/material.dart';
import 'package:product_cart/provider/cartprovider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Cart'),
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFFFFCF8),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final productName = cart.items.keys.elementAt(index);
                    final product = cart.items[productName];
                    final itemTotalPrice =
                        product?['price'] * product?['quantity'];
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
                                  'Quantity: ${product?['quantity']}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 93, 91, 91),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Total Price: \$${itemTotalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
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
                                  cart.removeItem(productName);
                                },
                                icon: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  margin: EdgeInsets.all(20.0),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color.fromARGB(255, 250, 231, 210),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Total Price:',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 128, 128, 128)),
                          ),
                          Text(
                            '\$ ${cart.totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
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
                              Icon(
                                Icons.paid,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Proceed to Pay',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
