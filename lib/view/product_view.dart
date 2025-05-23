import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_guide/comman_widget/async_value_widget.dart';
import 'package:riverpod_architecture_guide/data/mock_product_repo.dart';
import 'package:riverpod_architecture_guide/view/product_details_screen.dart';


class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final productList = ref.watch(streamProudctProvider);
    final productList = ref.watch(futureProductProvider);
    return AsyncValueWidget(value: productList, data: (products) =>
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
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final recommendedProduct = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: recommendedProduct)));
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
        ),);
  }
}
