import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_product_repo.dart';

// here we use Consumer
class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Related Items", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              // final itemList = ref.watch(futuerItemProvider);
              final itemList = ref.watch(streamItemProvider);
              return itemList.when(data: (xitem)=> SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: xitem.length,
                  itemBuilder: (context, index) {
                    final item = xitem[index];
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
                                child:
                                item.imageUrl != null
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
              ), error: (e,st)=>Text(e.toString()),
              loading: ()=>Center(child: CircularProgressIndicator(),));
            },
          ),
        ],
      ),
    );
  }
}
