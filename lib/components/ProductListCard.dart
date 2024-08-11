import 'package:flutter/material.dart';
import 'package:product_cart/pages/productdetails.dart';

class ProductCardList extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCardList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Productdetails(product: product),
          ),
        );
      },
      child: Container(
          width: 200,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Color(0xFFFAF2E9),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: AssetImage(product['image']),
                  height: 125,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product['category'],
                    style: const TextStyle(fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${product['price'].toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFB03C),
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 150, 59),
                          ),
                          Text(product['rating'].toString())
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
