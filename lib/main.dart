import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_guide/view/product_view.dart';

import 'data/mock_product_repo.dart';
import 'view/item_view.dart';

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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final product = ref.watch(productProvider).getProduct(id)!;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final product =  ref.watch(getProductProvider(id));
               return product.when(data: (product)=> Container(
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
               ),  error: (e,st)=>Text(e.toString()),
                   loading: ()=>Center(child: CircularProgressIndicator(),));
              },
            ),
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
            ItemView(),
            ProductView(),

          ],
        ),
      ),
    );
  }}
