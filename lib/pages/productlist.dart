import 'package:flutter/material.dart';
import 'package:product_cart/components/ProductListCard.dart';
import 'package:product_cart/components/bottomNavbar.dart';
import 'package:product_cart/data/dummydata.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredProducts = furnitureMenu;

  void filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredProducts = furnitureMenu;
      });
    } else {
      List<String> searchTerms = query.toLowerCase().split(' ');
      setState(() {
        filteredProducts = furnitureMenu.where((product) {
          String name = product['name'].toLowerCase();
          String category = product['category'].toLowerCase();
          return searchTerms.every((term) =>
              name.contains(term) || category.contains(term));
        }).toList();
      });
    }
  }

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(8.0),
              ),
              onChanged: filterProducts,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 0.6625, // Aspect ratio of each item (width / height)
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                itemBuilder: (context, index) =>
                    ProductCardList(product: filteredProducts[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
