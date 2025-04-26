import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/mock_product_repo.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(id: '1',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.id});
  final String id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final itemList = MockProductRepo.instance.getItemList();
    final productList = MockProductRepo.instance.getProductList();
    final product = MockProductRepo.instance.getProduct(widget.id)!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Center(
                child: product.imageUrl != null
                    ? Image.network(product.imageUrl!)
                    : const Icon(Icons.image, size: 120, color: Colors.grey),
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description ?? "No description available",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text("Add to Cart"),
                        onPressed: () {
                          // Add to cart functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${product.title} added to cart"))
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Related Items
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Related Items",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        final item = itemList[index];
                        return Card(
                          margin: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: 130,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: item.imageUrl != null
                                        ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                                        : const Icon(Icons.image, size: 40),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$${item.price?.toStringAsFixed(2) ?? '0.00'}",
                                  style: const TextStyle(color: Colors.deepOrange),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Popular Products
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Popular Products",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        final recommendedProduct = productList[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to product detail
                            // Navigator.push(...);
                          },
                          child: Card(
                            margin: const EdgeInsets.only(right: 16),
                            child: Container(
                              width: 160,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: recommendedProduct.imageUrl != null
                                            ? Image.network(recommendedProduct.imageUrl!)
                                            : const Icon(Icons.image, size: 60),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    recommendedProduct.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${recommendedProduct.price.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add_circle, color: Colors.deepOrange),
                                        onPressed: () {
                                          // Add to cart functionality
                                        },
                                        iconSize: 20,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}
